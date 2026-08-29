private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class Output
    property output_key : String | Nil

    property output_value : String | Nil

    property description : String | Nil

    property export_name : String | Nil

    def initialize(
      @output_key : String | Nil = nil,
      @output_value : String | Nil = nil,
      @description : String | Nil = nil,
      @export_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @output_key
        params << {"#{prefix}OutputKey", value}
      end

      if value = @output_value
        params << {"#{prefix}OutputValue", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @export_name
        params << {"#{prefix}ExportName", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        output_key: Core::XMLValue.string(node.xpath_node("*[local-name()='OutputKey']")),
        output_value: Core::XMLValue.string(node.xpath_node("*[local-name()='OutputValue']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        export_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ExportName']")),
      )
    end
  end
end
