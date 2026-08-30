module Amazonite::CloudFormationV1
  # Contains any warnings returned by the `GetTemplateSummary` API action.
  class Warnings
    # A list of all of the unrecognized resource types. This is only returned if the
    # `TemplateSummaryConfig` parameter has the `TreatUnrecognizedResourceTypesAsWarning`
    # configuration set to `True`.
    property unrecognized_resource_types : Array(String) | Nil

    def initialize(
      @unrecognized_resource_types : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@unrecognized_resource_types || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}UnrecognizedResourceTypes.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        unrecognized_resource_types: node.xpath_nodes("*[local-name()='UnrecognizedResourceTypes']/*[local-name()='member']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@unrecognized_resource_types)
  end
end
