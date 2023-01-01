module Amazonite::SsmV1
  class DeleteResourceDataSyncRequest
    include JSON::Serializable

    @[JSON::Field(key: "SyncName")]
    property sync_name : String

    @[JSON::Field(key: "SyncType")]
    property sync_type : String | Nil

    def initialize(
      @sync_name : String,
      @sync_type : String | Nil = nil
    )
    end
  end
end
