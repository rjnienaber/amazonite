private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class TemplateSummaryConfig
    property treat_unrecognized_resource_types_as_warnings : Bool | Nil

    def initialize(
      @treat_unrecognized_resource_types_as_warnings : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @treat_unrecognized_resource_types_as_warnings
        params << {"#{prefix}TreatUnrecognizedResourceTypesAsWarnings", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        treat_unrecognized_resource_types_as_warnings: Core::XMLValue.bool(node.xpath_node("*[local-name()='TreatUnrecognizedResourceTypesAsWarnings']")),
      )
    end
  end
end
