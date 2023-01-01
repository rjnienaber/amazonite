module Amazonite::SsmV1
  class ListOpsMetadataResult
    include JSON::Serializable

    @[JSON::Field(key: "OpsMetadataList")]
    property ops_metadata_list : Array(OpsMetadata) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @ops_metadata_list : Array(OpsMetadata) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
