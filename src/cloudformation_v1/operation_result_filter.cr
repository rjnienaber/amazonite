private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class OperationResultFilter
    property name : OperationResultFilterName | Nil

    property values : String | Nil

    def initialize(
      @name : OperationResultFilterName | Nil = nil,
      @values : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @name
        params << {"#{prefix}Name", value.to_json_object_key}
      end

      if value = @values
        params << {"#{prefix}Values", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        name: (n = node.xpath_node("*[local-name()='Name']")) ? ACF::OperationResultFilterName.from_json_object_key?(n.content) : nil,
        values: Core::XMLValue.string(node.xpath_node("*[local-name()='Values']")),
      )
    end
  end
end
