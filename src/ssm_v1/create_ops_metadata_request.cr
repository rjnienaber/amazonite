module Amazonite::SsmV1
  class CreateOpsMetadataRequest
    include JSON::Serializable

    # A resource ID for a new Application Manager application.
    @[JSON::Field(key: "ResourceId")]
    property resource_id : String

    # Metadata for a new Application Manager application.
    @[JSON::Field(key: "Metadata")]
    property metadata : Hash(String, MetadataValue) | Nil

    # Optional metadata that you assign to a resource. You can specify a maximum of five tags for an
    # OpsMetadata object. Tags enable you to categorize a resource in different ways, such as by
    # purpose, owner, or environment. For example, you might want to tag an OpsMetadata object to
    # identify an environment or target Amazon Web Services Region. In this case, you could specify
    # the following key-value pairs:
    #
    # - `Key=Environment,Value=Production`
    #
    # - `Key=Region,Value=us-east-2`
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    def initialize(
      @resource_id : String,
      @metadata : Hash(String, MetadataValue) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def_equals_and_hash(@resource_id, @metadata, @tags)
  end
end
