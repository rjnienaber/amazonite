private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # Details about a resource in a generated template
  class ResourceDetail
    # The type of the resource, such as `AWS::DynamoDB::Table`. For the list of supported resources,
    # see [Resource type support for imports and drift
    # detection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import-supported-resources.html)
    # In the *CloudFormation User Guide*
    property resource_type : String | Nil

    # The logical id for this resource in the final generated template.
    property logical_resource_id : String | Nil

    # A list of up to 256 key-value pairs that identifies the resource in the generated template. The
    # key is the name of one of the primary identifiers for the resource. (Primary identifiers are
    # specified in the `primaryIdentifier` list in the resource schema.) The value is the value of
    # that primary identifier. For example, for a `AWS::DynamoDB::Table` resource, the primary
    # identifiers is `TableName` so the key-value pair could be `"TableName": "MyDDBTable"`. For more
    # information, see
    # [primaryIdentifier](https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html#schema-properties-primaryidentifier)
    # in the *CloudFormation Command Line Interface (CLI) User Guide*.
    property resource_identifier : Hash(String, String) | Nil

    # Status of the processing of a resource in a generated template.
    #
    # InProgress The resource processing is still in progress.
    #
    # Complete The resource processing is complete.
    #
    # Pending The resource processing is pending.
    #
    # Failed The resource processing has failed.
    property resource_status : GeneratedTemplateResourceStatus | Nil

    # The reason for the resource detail, providing more information if a failure happened.
    property resource_status_reason : String | Nil

    # The warnings generated for this resource.
    property warnings : Array(WarningDetail) | Nil

    def initialize(
      @resource_type : String | Nil = nil,
      @logical_resource_id : String | Nil = nil,
      @resource_identifier : Hash(String, String) | Nil = nil,
      @resource_status : GeneratedTemplateResourceStatus | Nil = nil,
      @resource_status_reason : String | Nil = nil,
      @warnings : Array(WarningDetail) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @resource_type
        params << {"#{prefix}ResourceType", value}
      end

      if value = @logical_resource_id
        params << {"#{prefix}LogicalResourceId", value}
      end

      (@resource_identifier || {} of String => String).each_with_index(1) do |(key, value), i|
        params << {"#{prefix}ResourceIdentifier.entry.#{i}.key", key}
        params << {"#{prefix}ResourceIdentifier.entry.#{i}.value", value}
      end

      if value = @resource_status
        params << {"#{prefix}ResourceStatus", value.to_json_object_key}
      end

      if value = @resource_status_reason
        params << {"#{prefix}ResourceStatusReason", value}
      end

      (@warnings || [] of WarningDetail).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Warnings.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource_type: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceType']")),
        logical_resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='LogicalResourceId']")),
        resource_identifier: node.xpath_nodes("*[local-name()='ResourceIdentifier']/*[local-name()='entry']").each_with_object({} of String => String) { |entry, hash| hash[entry.xpath_node("*[local-name()='key']").not_nil!.content] = entry.xpath_node("*[local-name()='value']").not_nil!.content },
        resource_status: (n = node.xpath_node("*[local-name()='ResourceStatus']")) ? ACF::GeneratedTemplateResourceStatus.from_json_object_key?(n.content) : nil,
        resource_status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceStatusReason']")),
        warnings: node.xpath_nodes("*[local-name()='Warnings']/*[local-name()='member']").map { |n| WarningDetail.from_xml(n) },
      )
    end

    def_equals_and_hash(@resource_type, @logical_resource_id, @resource_identifier, @resource_status, @resource_status_reason, @warnings)
  end
end
