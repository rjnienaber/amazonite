private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Information about a resource data sync configuration, including its current status and last
  # successful sync.
  class ResourceDataSyncItem
    include JSON::Serializable

    # The name of the resource data sync.
    @[JSON::Field(key: "SyncName")]
    property sync_name : String | Nil

    # The type of resource data sync. If `SyncType` is `SyncToDestination`, then the resource data
    # sync synchronizes data to an S3 bucket. If the `SyncType` is `SyncFromSource` then the resource
    # data sync synchronizes data from Organizations or from multiple Amazon Web Services Regions.
    @[JSON::Field(key: "SyncType")]
    property sync_type : String | Nil

    # Information about the source where the data was synchronized.
    @[JSON::Field(key: "SyncSource")]
    property sync_source : ResourceDataSyncSourceWithState | Nil

    # Configuration information for the target S3 bucket.
    @[JSON::Field(key: "S3Destination")]
    property s3_destination : ResourceDataSyncS3Destination | Nil

    # The last time the configuration attempted to sync (UTC).
    @[JSON::Field(key: "LastSyncTime", converter: Core::AWSEpochConverter)]
    property last_sync_time : Time | Nil

    # The last time the sync operations returned a status of `SUCCESSFUL` (UTC).
    @[JSON::Field(key: "LastSuccessfulSyncTime", converter: Core::AWSEpochConverter)]
    property last_successful_sync_time : Time | Nil

    # The date and time the resource data sync was changed.
    @[JSON::Field(key: "SyncLastModifiedTime", converter: Core::AWSEpochConverter)]
    property sync_last_modified_time : Time | Nil

    # The status reported by the last sync.
    @[JSON::Field(key: "LastStatus", converter: AS::LastResourceDataSyncStatus)]
    property last_status : LastResourceDataSyncStatus | Nil

    # The date and time the configuration was created (UTC).
    @[JSON::Field(key: "SyncCreatedTime", converter: Core::AWSEpochConverter)]
    property sync_created_time : Time | Nil

    # The status message details reported by the last sync.
    @[JSON::Field(key: "LastSyncStatusMessage")]
    property last_sync_status_message : String | Nil

    def initialize(
      @sync_name : String | Nil = nil,
      @sync_type : String | Nil = nil,
      @sync_source : ResourceDataSyncSourceWithState | Nil = nil,
      @s3_destination : ResourceDataSyncS3Destination | Nil = nil,
      @last_sync_time : Time | Nil = nil,
      @last_successful_sync_time : Time | Nil = nil,
      @sync_last_modified_time : Time | Nil = nil,
      @last_status : LastResourceDataSyncStatus | Nil = nil,
      @sync_created_time : Time | Nil = nil,
      @last_sync_status_message : String | Nil = nil,
    )
    end

    def_equals_and_hash(@sync_name, @sync_type, @sync_source, @s3_destination, @last_sync_time, @last_successful_sync_time, @sync_last_modified_time, @last_status, @sync_created_time, @last_sync_status_message)
  end
end
