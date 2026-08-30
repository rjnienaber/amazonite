module Amazonite::SsmV1
  class UpdateResourceDataSyncRequest
    include JSON::Serializable

    # The name of the resource data sync you want to update.
    @[JSON::Field(key: "SyncName")]
    property sync_name : String

    # The type of resource data sync. The supported `SyncType` is SyncFromSource.
    @[JSON::Field(key: "SyncType")]
    property sync_type : String

    # Specify information about the data sources to synchronize.
    @[JSON::Field(key: "SyncSource")]
    property sync_source : ResourceDataSyncSource

    def initialize(
      @sync_name : String,
      @sync_type : String,
      @sync_source : ResourceDataSyncSource,
    )
    end
  end
end
