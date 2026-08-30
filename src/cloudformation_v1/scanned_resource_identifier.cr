private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # Identifies a scanned resource. This is used with the `ListResourceScanRelatedResources` API
  # action.
  class ScannedResourceIdentifier
    # The type of the resource, such as `AWS::DynamoDB::Table`. For the list of supported resources,
    # see [Resource type support for imports and drift
    # detection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import-supported-resources.html)
    # In the *CloudFormation User Guide*.
    property resource_type : String

    # A list of up to 256 key-value pairs that identifies the scanned resource. The key is the name of
    # one of the primary identifiers for the resource. (Primary identifiers are specified in the
    # `primaryIdentifier` list in the resource schema.) The value is the value of that primary
    # identifier. For example, for a `AWS::DynamoDB::Table` resource, the primary identifiers is
    # `TableName` so the key-value pair could be `"TableName": "MyDDBTable"`. For more information,
    # see
    # [primaryIdentifier](https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html#schema-properties-primaryidentifier)
    # in the *CloudFormation Command Line Interface (CLI) User Guide*.
    property resource_identifier : Hash(String, String)

    def initialize(
      @resource_type : String,
      @resource_identifier : Hash(String, String),
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ResourceType", @resource_type}

      @resource_identifier.each_with_index(1) do |(key, value), i|
        params << {"#{prefix}ResourceIdentifier.entry.#{i}.key", key}
        params << {"#{prefix}ResourceIdentifier.entry.#{i}.value", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource_type: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceType']")).not_nil!,
        resource_identifier: node.xpath_nodes("*[local-name()='ResourceIdentifier']/*[local-name()='entry']").each_with_object({} of String => String) { |entry, hash| hash[entry.xpath_node("*[local-name()='key']").not_nil!.content] = entry.xpath_node("*[local-name()='value']").not_nil!.content },
      )
    end
  end
end
