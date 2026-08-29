module Amazonite::IamV1
  class ReplacementValueEntry
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
  end
end
