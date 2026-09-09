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
        # "*" is AWS's wildcard within an enum value (S3's Event enum has
        # both "s3:ObjectCreated:*" and "s3:ObjectCreated:Put"), and no
        # identifier can carry it. Spell it out rather than stripping it,
        # which would render the wildcard member as "S3ObjectCreated" - a
        # name that reads like one specific event rather than all of them.
        .gsub("*", "All")
        # get rid of non-character values - parentheses included, since EC2
        # spells a couple of enum values out as prose ("Linux/UNIX (Amazon
        # VPC)"), and they can't survive into an identifier either
        .split(/[-:\._\/() ]/)
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
      # Unescaping above turns EC2's "&amp;;" (in a list of the characters a
      # tag value may contain) into "&;", an empty entity reference that
      # crashes the markd build vendored into the Crystal compiler - and so
      # `crystal docs` - with `Index out of bounds`. A backslash escape renders
      # as a literal ampersand and keeps the decoder away from it.
      text = text.gsub(/&(?=;)/) { "\\&" }
      text = text.gsub(/ {2,}/, " ")
      text = text.gsub(/[ \t]*\n[ \t]*/, "\n").gsub(/\n{3,}/, "\n\n").strip

      return if text.empty?

      lines = [] of String
      text.split("\n\n").each_with_index do |block, i|
        lines << "" if i > 0
        block.split("\n").each { |line| lines.concat(wrap_line(line.strip, LINE_WIDTH)) }
      end

      lines.map { |line| line.empty? ? "#" : "# #{defuse_list_marker(line)}" }.join("\n")
    end

    # Wrapping keeps an Int32-overflowing number off the start of a line
    # wherever there is an earlier word to hold it in place, but a paragraph or
    # list item that *opens* with one has no such word. Swap that first digit
    # for the numeric character reference naming it - "&#52;" for "4" - which
    # renders as the digit itself and leaves markd nothing numeric to read
    # where it looks for an ordered-list marker.
    private def self.defuse_list_marker(line : String) : String
      # markd re-scans a list item's content for a marker of its own, so the
      # digits it trips over can sit after a bullet rather than at column 0.
      marker = line[/\A(?:[-*+] |[0-9]{1,9}[.)] )?/]
      rest = line[marker.size..]
      return line unless starts_int32_overflow?(rest)

      "#{marker}&##{rest[0].ord};#{rest[1..]}"
    end

    private def self.wrap_line(text : String, width : Int32) : Array(String)
      return [""] if text.empty?

      result = [] of String
      current = ""
      text.split(" ").each do |word|
        candidate = current.empty? ? word : "#{current} #{word}"
        # Overshoot the width rather than break in front of a number that
        # can't open a line: keeping the text plain reads better than the
        # character-reference escape `defuse_list_marker` would fall back to.
        if candidate.size > width && !current.empty? && !starts_int32_overflow?(word)
          result << current
          current = word
        else
          current = candidate
        end
      end
      result << current unless current.empty?
      result
    end

    # True for a word the markd build vendored into the Crystal compiler cannot
    # survive at the start of a line: it reads the run of digits the line opens
    # with and converts it to Int32 *before* checking the run is short enough
    # to be an ordered-list number, so anything above Int32::MAX aborts
    # `crystal docs` with `Invalid Int32`. EC2 hits this describing 32-bit ASN
    # ranges ("4200000000 to 4294967294").
    private def self.starts_int32_overflow?(word : String) : Bool
      digits = word[/\A[0-9]+/]?
      !digits.nil? && digits.to_i?.nil?
    end
  end
end
