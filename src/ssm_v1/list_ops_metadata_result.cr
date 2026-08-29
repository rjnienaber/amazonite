module Amazonite::SsmV1
  class ListOpsMetadataResult
    include JSON::Serializable

    # Returns a list of OpsMetadata objects.
    @[JSON::Field(key: "OpsMetadataList")]
    property ops_metadata_list : Array(OpsMetadata) | Nil

    # The token for the next set of items to return. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @ops_metadata_list : Array(OpsMetadata) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
