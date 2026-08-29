private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class GetTemplateSummaryOutput
    property parameters : Array(ParameterDeclaration) | Nil

    property description : String | Nil

    property capabilities : Array(Capability) | Nil

    property capabilities_reason : String | Nil

    property resource_types : Array(String) | Nil

    property version : String | Nil

    property metadata : String | Nil

    property declared_transforms : Array(String) | Nil

    property resource_identifier_summaries : Array(ResourceIdentifierSummary) | Nil

    property warnings : Warnings | Nil

    def initialize(
      @parameters : Array(ParameterDeclaration) | Nil = nil,
      @description : String | Nil = nil,
      @capabilities : Array(Capability) | Nil = nil,
      @capabilities_reason : String | Nil = nil,
      @resource_types : Array(String) | Nil = nil,
      @version : String | Nil = nil,
      @metadata : String | Nil = nil,
      @declared_transforms : Array(String) | Nil = nil,
      @resource_identifier_summaries : Array(ResourceIdentifierSummary) | Nil = nil,
      @warnings : Warnings | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@parameters || [] of ParameterDeclaration).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Parameters.member.#{i}."))
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      (@capabilities || [] of Capability).each_with_index(1) do |item, i|
        params << {"#{prefix}Capabilities.member.#{i}", item.to_json_object_key}
      end

      if value = @capabilities_reason
        params << {"#{prefix}CapabilitiesReason", value}
      end

      (@resource_types || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ResourceTypes.member.#{i}", item}
      end

      if value = @version
        params << {"#{prefix}Version", value}
      end

      if value = @metadata
        params << {"#{prefix}Metadata", value}
      end

      (@declared_transforms || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}DeclaredTransforms.member.#{i}", item}
      end

      (@resource_identifier_summaries || [] of ResourceIdentifierSummary).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ResourceIdentifierSummaries.member.#{i}."))
      end

      if value = @warnings
        params.concat(value.to_query_params("#{prefix}Warnings."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        parameters: node.xpath_nodes("*[local-name()='Parameters']/*[local-name()='member']").map { |n| ParameterDeclaration.from_xml(n) },
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        capabilities: node.xpath_nodes("*[local-name()='Capabilities']/*[local-name()='member']").compact_map { |n| ACF::Capability.from_json_object_key?(n.content) },
        capabilities_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='CapabilitiesReason']")),
        resource_types: node.xpath_nodes("*[local-name()='ResourceTypes']/*[local-name()='member']").map { |n| n.content },
        version: Core::XMLValue.string(node.xpath_node("*[local-name()='Version']")),
        metadata: Core::XMLValue.string(node.xpath_node("*[local-name()='Metadata']")),
        declared_transforms: node.xpath_nodes("*[local-name()='DeclaredTransforms']/*[local-name()='member']").map { |n| n.content },
        resource_identifier_summaries: node.xpath_nodes("*[local-name()='ResourceIdentifierSummaries']/*[local-name()='member']").map { |n| ResourceIdentifierSummary.from_xml(n) },
        warnings: node.xpath_node("*[local-name()='Warnings']").try { |n| Warnings.from_xml(n) },
      )
    end
  end
end
