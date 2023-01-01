private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class ResourceDataSyncItem
    include JSON::Serializable

    @[JSON::Field(key: "SyncName")]
    property sync_name : String | Nil

    @[JSON::Field(key: "SyncType")]
    property sync_type : String | Nil

    @[JSON::Field(key: "SyncSource")]
    property sync_source : ResourceDataSyncSourceWithState | Nil

    @[JSON::Field(key: "S3Destination")]
    property s3_destination : ResourceDataSyncS3Destination | Nil

    @[JSON::Field(key: "LastSyncTime", converter: Core::AWSEpochConverter)]
    property last_sync_time : Time | Nil

    @[JSON::Field(key: "LastSuccessfulSyncTime", converter: Core::AWSEpochConverter)]
    property last_successful_sync_time : Time | Nil

    @[JSON::Field(key: "SyncLastModifiedTime", converter: Core::AWSEpochConverter)]
    property sync_last_modified_time : Time | Nil

    @[JSON::Field(key: "LastStatus", converter: AS::LastResourceDataSyncStatus)]
    property last_status : LastResourceDataSyncStatus | Nil

    @[JSON::Field(key: "SyncCreatedTime", converter: Core::AWSEpochConverter)]
    property sync_created_time : Time | Nil

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
      @last_sync_status_message : String | Nil = nil
    )
    end
  end
end
