# Prepares the output of `crystal docs` for publishing, which for a project
# this size means getting it under the 1GB GitHub Pages allows a published
# site. Two things account for nearly all of it.
#
# The first is the sidebar. Crystal's doc generator writes the project's
# entire type tree into the sidebar of every page it emits. That is quadratic
# in the number of types, and the generated AWS bindings have enough of them
# for it to dominate everything else: a leaf page is ~1.9MB, of which ~14KB is
# the type's own documentation and the rest is a copy of the same tree. Across
# ~7,300 pages that is ~13GB.
#
# The tree is identical on every page apart from the highlighting of the type
# being viewed, so this lifts it into a single `types-list.js` the browser
# caches once and replaces each page's copy with an empty container.
# `js/sidebar.js` fills the container back in and re-applies the highlighting,
# running at the end of the body so the tree is in place before doc.js wires
# up the sidebar on DOMContentLoaded.
#
# The second is the search index, which the generator emits twice: as JSON,
# and as a JSONP copy that doc.js reads only when the docs are opened from
# disk. A published site always takes the JSON, so the copy is dropped.
#
# The sidebar work is coupled to the generator's HTML, so every step that
# reads that HTML aborts rather than writing a page whose sidebar would
# silently be empty.

require "json"

DOCS = "docs"

def abort_with(message : String) : NoReturn
  STDERR.puts "prepare_docs: #{message}"
  exit 1
end

# The whole `<div class="types-list">` element, so a page can be handed back an
# empty one of its own.
TYPES_LIST = /<div class="types-list">\n(?<tree>.*?)\n  <\/div>/m

# Every page records the prefix that gets it back to the docs root, which is
# what the shared tree's links - written relative to that root - need.
BASE_PATH = /CrystalDocs\.base_path = "(?<base>[^"]*)";/

# The generator marks the type being viewed, and each of its ancestors, with
# "current"; ancestors carry "open" as well so the tree unfolds down to it.
CURRENT = /<li class="[^"]*current[^"]*" data-id="(?<id>[^"]*)"/

pages = Dir.glob(File.join(DOCS, "**", "*.html")).sort
abort_with("no pages under #{DOCS}/ - run `crystal docs` first") if pages.empty?

# Take the shared copy from the root page, whose links need no prefix.
index = File.join(DOCS, "index.html")
abort_with("#{index} is missing") unless File.exists?(index)
tree = TYPES_LIST.match(File.read(index)).try(&.["tree"])
abort_with("no types-list in #{index} - the doc generator's HTML has changed") if tree.nil?

# The root page is the one page the generator leaves unhighlighted, which is
# why the shared copy comes from there - anything it marked would be baked into
# every page's sidebar.
if tree.matches?(/class="[^"]*(?:current|open)/)
  abort_with("#{index} highlights a type, so its tree can't be the shared one")
end

File.write(File.join(DOCS, "types-list.js"), "window.CRYSTAL_TYPES_LIST = #{tree.to_json};\n")

File.write(File.join(DOCS, "js", "sidebar.js"), <<-JS)
  // Written by scripts/share_docs_sidebar.cr - see the comment there.
  (function () {
    var list = document.querySelector(".types-list");
    if (!list || typeof window.CRYSTAL_TYPES_LIST !== "string") return;

    list.innerHTML = window.CRYSTAL_TYPES_LIST;

    // The shared tree links relative to the docs root; this page may be deeper.
    var base = (window.CrystalDocs && CrystalDocs.base_path) || "";
    if (base) {
      var links = list.querySelectorAll("a[href]");
      for (var i = 0; i < links.length; i++) {
        links[i].setAttribute("href", base + links[i].getAttribute("href"));
      }
    }

    // Re-apply what the per-page copies used to carry: the type being viewed is
    // "current", and its ancestors are "open" so the tree unfolds down to it.
    var id = list.getAttribute("data-current-id");
    if (!id) return;
    var item = list.querySelector('li[data-id="' + id + '"]');
    while (item) {
      item.classList.add("current");
      item = item.parentElement && item.parentElement.closest("li");
      if (item) item.classList.add("open");
    }
  })();
  JS

pages.each do |page|
  html = File.read(page)

  match = TYPES_LIST.match(html)
  abort_with("no types-list in #{page} - the doc generator's HTML has changed") if match.nil?

  base = BASE_PATH.match(html).try(&.["base"])
  abort_with("no base_path in #{page} - the doc generator's HTML has changed") if base.nil?

  # The last "current" is the type itself; the earlier ones are its ancestors.
  current = match["tree"].scan(CURRENT).map(&.["id"]).last?

  container = %(<div class="types-list"#{current ? %( data-current-id="#{current}") : ""}>\n  </div>)
  html = html.sub(match[0], container)

  scripts = %(<script type="text/javascript" src="#{base}types-list.js"></script>\n) +
            %(<script type="text/javascript" src="#{base}js/sidebar.js"></script>\n)
  abort_with("no </body> in #{page}") unless html.includes?("</body>")
  html = html.sub("</body>", "#{scripts}</body>")

  File.write(page, html)
end

puts "prepare_docs: shared the type tree across #{pages.size} pages"

# doc.js picks the JSONP copy only under file://, so nothing the published site
# does will ever fetch it. Absent, the site is still correct - this is only
# here to keep it out of the upload.
jsonp_index = File.join(DOCS, "search-index.js")
if File.exists?(jsonp_index)
  freed = File.size(jsonp_index) // 1024 // 1024
  File.delete(jsonp_index)
  puts "prepare_docs: dropped search-index.js (#{freed}MB the site never reads)"
end
