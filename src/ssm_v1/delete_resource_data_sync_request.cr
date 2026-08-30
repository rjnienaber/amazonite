module Amazonite::SsmV1
  class DeleteResourceDataSyncRequest
    include JSON::Serializable

    # The name of the configuration to delete.
    @[JSON::Field(key: "SyncName")]
    property sync_name : String

    # Specify the type of resource data sync to delete.
    @[JSON::Field(key: "SyncType")]
    property sync_type : String | Nil

    def initialize(
      @sync_name : String,
      @sync_type : String | Nil = nil,
    )
    end

    def_equals_and_hash(@sync_name, @sync_type)
  end
end
