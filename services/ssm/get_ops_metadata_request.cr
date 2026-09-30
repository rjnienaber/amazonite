private alias Core = Amazonite::Core

module Amazonite::Ssm
  class GetOpsMetadataRequest
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of an OpsMetadata Object to view.
    @[JSON::Field(key: "OpsMetadataArn")]
    property ops_metadata_arn : String

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # A token to start the list. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @ops_metadata_arn : String,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @ops_metadata_arn
        raise Core::ValidationError.new("OpsMetadataArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("OpsMetadataArn length must be <= 1011") if value.size > 1011
        raise Core::ValidationError.new("OpsMetadataArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z-]*)?:ssm:[a-z0-9-\\.]{0,63}:[a-z0-9-\\.]{0,63}:opsmetadata\\/([a-zA-Z0-9-_\\.\\/]*)$"))
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 10") if value > 10
      end
    end

    def_equals_and_hash(@ops_metadata_arn, @max_results, @next_token)
  end
end
