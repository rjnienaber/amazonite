private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # Options for the `GetTemplateSummary` API action.
  class TemplateSummaryConfig
    # If set to `True`, any unrecognized resource types generate warnings and not an error. Any
    # unrecognized resource types are returned in the `Warnings` output parameter.
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

    def validate! : Nil
    end

    def_equals_and_hash(@treat_unrecognized_resource_types_as_warnings)
  end
end
