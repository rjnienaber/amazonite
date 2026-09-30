private alias Core = Amazonite::Core

module Amazonite::Ssm
  class UpdateOpsMetadataResult
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the OpsMetadata Object that was updated.
    @[JSON::Field(key: "OpsMetadataArn")]
    property ops_metadata_arn : String | Nil

    def initialize(
      @ops_metadata_arn : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @ops_metadata_arn
        raise Core::ValidationError.new("OpsMetadataArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("OpsMetadataArn length must be <= 1011") if value.size > 1011
        raise Core::ValidationError.new("OpsMetadataArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z-]*)?:ssm:[a-z0-9-\\.]{0,63}:[a-z0-9-\\.]{0,63}:opsmetadata\\/([a-zA-Z0-9-_\\.\\/]*)$"))
      end
    end

    def_equals_and_hash(@ops_metadata_arn)
  end
end
