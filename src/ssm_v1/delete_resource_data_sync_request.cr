private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @sync_name
        raise Core::ValidationError.new("SyncName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SyncName length must be <= 64") if value.size > 64
      end

      if value = @sync_type
        raise Core::ValidationError.new("SyncType length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SyncType length must be <= 64") if value.size > 64
      end
    end

    def_equals_and_hash(@sync_name, @sync_type)
  end
end
