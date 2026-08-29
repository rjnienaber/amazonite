private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListImportsOutput
    # A list of stack names that are importing the specified exported output value.
    property imports : Array(String) | Nil

    # A string that identifies the next page of exports. If there is no additional page, this value is
    # null.
    property next_token : String | Nil

    def initialize(
      @imports : Array(String) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@imports || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}Imports.member.#{i}", item}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        imports: node.xpath_nodes("*[local-name()='Imports']/*[local-name()='member']").map { |n| n.content },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end
  end
end
