module Amazonite::Codegen::Service
  class Utils
    def self.verify_keys(known_keys, json : JSON::Any)
      hash = json.as_h?
      return if hash.nil?

      unknown_keys = (hash.keys - known_keys).join("\", \"")
      raise Exception.new("unknown keys: \"#{unknown_keys}\"") unless unknown_keys.empty?
    end

    def self.snake_case_name(name)
      name.split(/([A-Z][a-z]+)/).reject { |v| v == "" }.map(&.downcase).join("_")
    end

    def self.pascal_case(name) : String
      name
        # get rid of non-character values
        .split(/[-:\._\/ ]/)
        # split up words on pascal that are pascal already
        # sometimes a string value will have mixed case so do this so all words
        # are treated the same later on
        .flat_map(&.split(/([A-Z][a-z]+)/)).reject { |v| v == "" }
        # should just have words at this point, convert them all to Pascal case
        .map { |v| v[0].upcase + v[1..].downcase }.join
    end

    private LINE_WIDTH = 96

    # Converts a Smithy `documentation` trait's HTML into a Crystal doc
    # comment - each returned line already carries its own leading "# "
    # (or bare "#" for a blank paragraph-break line), unindented, since
    # `Crystal.format` reindents comments to match their surrounding code
    # regardless of the indentation they arrive with.
    def self.doc_comment(html : String?) : String?
      return if html.nil? || html.strip.empty?

      text = html.gsub(/\s+/, " ").strip
      text = text.gsub(/<a\s+href="([^"]*)"[^>]*>(.*?)<\/a>/m) { "[#{$2}](#{$1})" }
      text = text.gsub(/<code>(.*?)<\/code>/m) { "`#{$1}`" }
      text = text.gsub(/<\/?(em|i)>/, "*")
      text = text.gsub(/<\/?(strong|b)>/, "**")
      text = text.gsub(/<li>\s*/, "\n- ")
      text = text.gsub(/<\/li>/, "")
      text = text.gsub(/<\/?(ul|ol)>/, "\n")
      text = text.gsub(/<\/p>/, "\n\n")
      text = text.gsub(/<p>/, "")
      text = text.gsub(/<[^>]+>/, "")
      text = text.gsub("&amp;", "&").gsub("&lt;", "<").gsub("&gt;", ">")
        .gsub("&quot;", "\"").gsub("&#39;", "'").gsub("&apos;", "'")
      text = text.gsub(/ {2,}/, " ")
      text = text.gsub(/[ \t]*\n[ \t]*/, "\n").gsub(/\n{3,}/, "\n\n").strip

      return if text.empty?

      lines = [] of String
      text.split("\n\n").each_with_index do |block, i|
        lines << "" if i > 0
        block.split("\n").each { |line| lines.concat(wrap_line(line.strip, LINE_WIDTH)) }
      end

      lines.map { |line| line.empty? ? "#" : "# #{line}" }.join("\n")
    end

    private def self.wrap_line(text : String, width : Int32) : Array(String)
      return [""] if text.empty?

      result = [] of String
      current = ""
      text.split(" ").each do |word|
        candidate = current.empty? ? word : "#{current} #{word}"
        if candidate.size > width && !current.empty?
          result << current
          current = word
        else
          current = candidate
        end
      end
      result << current unless current.empty?
      result
    end
  end
end
