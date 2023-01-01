module Amazonite::SsmV1
  class ListResourceDataSyncResult
    include JSON::Serializable

    @[JSON::Field(key: "ResourceDataSyncItems")]
    property resource_data_sync_items : Array(ResourceDataSyncItem) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @resource_data_sync_items : Array(ResourceDataSyncItem) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
