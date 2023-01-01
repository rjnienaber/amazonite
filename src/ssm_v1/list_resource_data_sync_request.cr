module Amazonite::SsmV1
  class ListResourceDataSyncRequest
    include JSON::Serializable

    @[JSON::Field(key: "SyncType")]
    property sync_type : String | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @sync_type : String | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil
    )
    end
  end
end
