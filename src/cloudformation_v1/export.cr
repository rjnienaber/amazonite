private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class Export
    property exporting_stack_id : String | Nil

    property name : String | Nil

    property value : String | Nil

    def initialize(
      @exporting_stack_id : String | Nil = nil,
      @name : String | Nil = nil,
      @value : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @exporting_stack_id
        params << {"#{prefix}ExportingStackId", value}
      end

      if value = @name
        params << {"#{prefix}Name", value}
      end

      if value = @value
        params << {"#{prefix}Value", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        exporting_stack_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ExportingStackId']")),
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='Name']")),
        value: Core::XMLValue.string(node.xpath_node("*[local-name()='Value']")),
      )
    end
  end
end
