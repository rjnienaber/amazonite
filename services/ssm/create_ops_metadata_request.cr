private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @resource_id
        raise Core::ValidationError.new("ResourceId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourceId length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("ResourceId does not match the required pattern") unless value.matches?(Regex.new("^(?!\\s*$).+$"))
      end

      if value = @metadata
        raise Core::ValidationError.new("Metadata must have at least 1 entry(s)") if value.size < 1
        raise Core::ValidationError.new("Metadata must have at most 5 entry(s)") if value.size > 5
        value.each_value(&.validate!)
      end

      if value = @tags
        raise Core::ValidationError.new("Tags must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Tags must have at most 1000 item(s)") if value.size > 1000
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@resource_id, @metadata, @tags)
  end
end
