module Amazonite::SsmV1
  class GetOpsMetadataRequest
    include JSON::Serializable

    @[JSON::Field(key: "OpsMetadataArn")]
    property ops_metadata_arn : String

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @ops_metadata_arn : String,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
