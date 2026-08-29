private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListExportsOutput
    property exports : Array(Export) | Nil

    property next_token : String | Nil

    def initialize(
      @exports : Array(Export) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@exports || [] of Export).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Exports.member.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        exports: node.xpath_nodes("*[local-name()='Exports']/*[local-name()='member']").map { |n| Export.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end
  end
end
