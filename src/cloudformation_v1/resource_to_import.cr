private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # Describes the target resource of an import operation.
  class ResourceToImport
    # The type of resource to import into your stack, such as `AWS::S3::Bucket`. For a list of
    # supported resource types, see [Resource type support for imports and drift
    # detection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import-supported-resources.html)
    # in the *CloudFormation User Guide*.
    property resource_type : String

    # The logical ID of the target resource as specified in the template.
    property logical_resource_id : String

    # A key-value pair that identifies the target resource. The key is an identifier property (for
    # example, `BucketName` for `AWS::S3::Bucket` resources) and the value is the actual property
    # value (for example, `MyS3Bucket`).
    property resource_identifier : Hash(String, String)

    def initialize(
      @resource_type : String,
      @logical_resource_id : String,
      @resource_identifier : Hash(String, String),
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ResourceType", @resource_type}

      params << {"#{prefix}LogicalResourceId", @logical_resource_id}

      @resource_identifier.each_with_index(1) do |(key, value), i|
        params << {"#{prefix}ResourceIdentifier.entry.#{i}.key", key}
        params << {"#{prefix}ResourceIdentifier.entry.#{i}.value", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource_type: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceType']")).not_nil!,
        logical_resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='LogicalResourceId']")).not_nil!,
        resource_identifier: node.xpath_nodes("*[local-name()='ResourceIdentifier']/*[local-name()='entry']").each_with_object({} of String => String) { |entry, hash| hash[entry.xpath_node("*[local-name()='key']").not_nil!.content] = entry.xpath_node("*[local-name()='value']").not_nil!.content },
      )
    end

    def validate! : Nil
      if value = @resource_type
        raise Core::ValidationError.new("ResourceType length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourceType length must be <= 256") if value.size > 256
      end

      if value = @resource_identifier
        raise Core::ValidationError.new("ResourceIdentifier must have at least 1 entry(s)") if value.size < 1
        raise Core::ValidationError.new("ResourceIdentifier must have at most 256 entry(s)") if value.size > 256
      end
    end

    def_equals_and_hash(@resource_type, @logical_resource_id, @resource_identifier)
  end
end
