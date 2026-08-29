module Amazonite::SsmV1
  class ListResourceDataSyncResult
    include JSON::Serializable

    # A list of your current resource data sync configurations and their statuses.
    @[JSON::Field(key: "ResourceDataSyncItems")]
    property resource_data_sync_items : Array(ResourceDataSyncItem) | Nil

    # The token for the next set of items to return. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @resource_data_sync_items : Array(ResourceDataSyncItem) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
