module Amazonite::SsmV1
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
  end
end
