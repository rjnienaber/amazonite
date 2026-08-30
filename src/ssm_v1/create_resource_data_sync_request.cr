module Amazonite::SsmV1
  class CreateResourceDataSyncRequest
    include JSON::Serializable

    # A name for the configuration.
    @[JSON::Field(key: "SyncName")]
    property sync_name : String

    # Amazon S3 configuration details for the sync. This parameter is required if the `SyncType` value
    # is SyncToDestination.
    @[JSON::Field(key: "S3Destination")]
    property s3_destination : ResourceDataSyncS3Destination | Nil

    # Specify `SyncToDestination` to create a resource data sync that synchronizes data to an S3
    # bucket for Inventory. If you specify `SyncToDestination`, you must provide a value for
    # `S3Destination`. Specify `SyncFromSource` to synchronize data from a single account and multiple
    # Regions, or multiple Amazon Web Services accounts and Amazon Web Services Regions, as listed in
    # Organizations for Explorer. If you specify `SyncFromSource`, you must provide a value for
    # `SyncSource`. The default value is `SyncToDestination`.
    @[JSON::Field(key: "SyncType")]
    property sync_type : String | Nil

    # Specify information about the data sources to synchronize. This parameter is required if the
    # `SyncType` value is SyncFromSource.
    @[JSON::Field(key: "SyncSource")]
    property sync_source : ResourceDataSyncSource | Nil

    def initialize(
      @sync_name : String,
      @s3_destination : ResourceDataSyncS3Destination | Nil = nil,
      @sync_type : String | Nil = nil,
      @sync_source : ResourceDataSyncSource | Nil = nil,
    )
    end

    def_equals_and_hash(@sync_name, @s3_destination, @sync_type, @sync_source)
  end
end
