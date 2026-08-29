private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  class WarningDetail
    property type : WarningType | Nil

    property properties : Array(WarningProperty) | Nil

    def initialize(
      @type : WarningType | Nil = nil,
      @properties : Array(WarningProperty) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @type
        params << {"#{prefix}Type", value.to_json_object_key}
      end

      (@properties || [] of WarningProperty).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Properties.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type: (n = node.xpath_node("*[local-name()='Type']")) ? ACF::WarningType.from_json_object_key?(n.content) : nil,
        properties: node.xpath_nodes("*[local-name()='Properties']/*[local-name()='member']").map { |n| WarningProperty.from_xml(n) },
      )
    end
  end
end
