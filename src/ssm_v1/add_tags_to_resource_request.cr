private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class AddTagsToResourceRequest
    include JSON::Serializable

    # Specifies the type of resource you are tagging.
    #
    # The `ManagedInstance` type for this API operation is for on-premises managed nodes. You must
    # specify the name of the managed node in the following format: `mi-*ID_number* `. For example,
    # `mi-1a2b3c4d5e6f`.
    @[JSON::Field(key: "ResourceType", converter: AS::ResourceTypeForTagging)]
    property resource_type : ResourceTypeForTagging

    # The resource ID you want to tag.
    #
    # Use the ID of the resource. Here are some examples:
    #
    # `MaintenanceWindow`: `mw-012345abcde`
    #
    # `PatchBaseline`: `pb-012345abcde`
    #
    # `Automation`: `example-c160-4567-8519-012345abcde`
    #
    # `OpsMetadata` object: `ResourceID` for tagging is created from the Amazon Resource Name (ARN)
    # for the object. Specifically, `ResourceID` is created from the strings that come after the word
    # `opsmetadata` in the ARN. For example, an OpsMetadata object with an ARN of
    # `arn:aws:ssm:us-east-2:1234567890:opsmetadata/aws/ssm/MyGroup/appmanager` has a `ResourceID` of
    # either `aws/ssm/MyGroup/appmanager` or `/aws/ssm/MyGroup/appmanager`.
    #
    # For the `Document` and `Parameter` values, use the name of the resource. If you're tagging a
    # shared document, you must use the full ARN of the document.
    #
    # `ManagedInstance`: `mi-012345abcde`
    #
    # The `ManagedInstance` type for this API operation is only for on-premises managed nodes. You
    # must specify the name of the managed node in the following format: `mi-*ID_number* `. For
    # example, `mi-1a2b3c4d5e6f`.
    @[JSON::Field(key: "ResourceId")]
    property resource_id : String

    # One or more tags. The value parameter is required.
    #
    # Don't enter personally identifiable information in this field.
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) = [] of Tag

    def initialize(
      @resource_type : ResourceTypeForTagging,
      @resource_id : String,
      @tags : Array(Tag),
    )
    end

    def validate! : Nil
      if value = @tags
        raise Core::ValidationError.new("Tags must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Tags must have at most 1000 item(s)") if value.size > 1000
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@resource_type, @resource_id, @tags)
  end
end
