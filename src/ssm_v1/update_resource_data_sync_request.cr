module Amazonite::SsmV1
  class UpdateResourceDataSyncRequest
    include JSON::Serializable

    @[JSON::Field(key: "SyncName")]
    property sync_name : String

    @[JSON::Field(key: "SyncType")]
    property sync_type : String

    @[JSON::Field(key: "SyncSource")]
    property sync_source : ResourceDataSyncSource

    def initialize(
      @sync_name : String,
      @sync_type : String,
      @sync_source : ResourceDataSyncSource
    )
    end
  end
end
