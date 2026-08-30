module Amazonite::IamV1
  # Contains the list of replacement values for a single template parameter used when creating a
  # role from a role template.
  class ReplacementValueEntry
    # The list of replacement values for the template parameter.
    property values : Array(String) = [] of String

    def initialize(
      @values : Array(String),
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @values.each_with_index(1) do |item, i|
        params << {"#{prefix}Values.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        values: node.xpath_nodes("*[local-name()='Values']/*[local-name()='member']").map { |n| n.content },
      )
    end

    def_equals_and_hash(@values)
  end
end
