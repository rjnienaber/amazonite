private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # Describes the target resources of a specific type in your import template (for example, all
  # `AWS::S3::Bucket` resources) and the properties you can provide during the import to identify
  # resources of that type.
  class ResourceIdentifierSummary
    # The template resource type of the target resources, such as `AWS::S3::Bucket`.
    property resource_type : String | Nil

    # The logical IDs of the target resources of the specified `ResourceType`, as defined in the
    # import template.
    property logical_resource_ids : Array(String) | Nil

    # The resource properties you can provide during the import to identify your target resources. For
    # example, `BucketName` is a possible identifier property for `AWS::S3::Bucket` resources.
    property resource_identifiers : Array(String) | Nil

    def initialize(
      @resource_type : String | Nil = nil,
      @logical_resource_ids : Array(String) | Nil = nil,
      @resource_identifiers : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @resource_type
        params << {"#{prefix}ResourceType", value}
      end

      (@logical_resource_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}LogicalResourceIds.member.#{i}", item}
      end

      (@resource_identifiers || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ResourceIdentifiers.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource_type: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceType']")),
        logical_resource_ids: node.xpath_nodes("*[local-name()='LogicalResourceIds']/*[local-name()='member']").map { |n| n.content },
        resource_identifiers: node.xpath_nodes("*[local-name()='ResourceIdentifiers']/*[local-name()='member']").map { |n| n.content },
      )
    end
  end
end
