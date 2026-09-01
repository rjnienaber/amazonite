private alias Core = Amazonite::Core

module Amazonite::Ssm
  class GetOpsMetadataResult
    include JSON::Serializable

    # The resource ID of the Application Manager application.
    @[JSON::Field(key: "ResourceId")]
    property resource_id : String | Nil

    # OpsMetadata for an Application Manager application.
    @[JSON::Field(key: "Metadata")]
    property metadata : Hash(String, MetadataValue) | Nil

    # The token for the next set of items to return. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @resource_id : String | Nil = nil,
      @metadata : Hash(String, MetadataValue) | Nil = nil,
      @next_token : String | Nil = nil,
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
    end

    def_equals_and_hash(@resource_id, @metadata, @next_token)
  end
end
