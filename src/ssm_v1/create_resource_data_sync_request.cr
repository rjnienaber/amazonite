module Amazonite::SsmV1
  class CreateResourceDataSyncRequest
    include JSON::Serializable

    @[JSON::Field(key: "SyncName")]
    property sync_name : String

    @[JSON::Field(key: "S3Destination")]
    property s3_destination : ResourceDataSyncS3Destination | Nil

    @[JSON::Field(key: "SyncType")]
    property sync_type : String | Nil

    @[JSON::Field(key: "SyncSource")]
    property sync_source : ResourceDataSyncSource | Nil

    def initialize(
      @sync_name : String,
      @s3_destination : ResourceDataSyncS3Destination | Nil = nil,
      @sync_type : String | Nil = nil,
      @sync_source : ResourceDataSyncSource | Nil = nil
    )
    end
  end
end
