private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @sync_name
        raise Core::ValidationError.new("SyncName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SyncName length must be <= 64") if value.size > 64
      end

      if value = @sync_type
        raise Core::ValidationError.new("SyncType length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SyncType length must be <= 64") if value.size > 64
      end

      if value = @sync_source
        value.validate!
      end
    end

    def_equals_and_hash(@sync_name, @sync_type, @sync_source)
  end
end
