private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class ResourceDataSyncS3Destination
    include JSON::Serializable

    @[JSON::Field(key: "BucketName")]
    property bucket_name : String

    @[JSON::Field(key: "Prefix")]
    property prefix : String | Nil

    @[JSON::Field(key: "SyncFormat", converter: AS::ResourceDataSyncS3Format)]
    property sync_format : ResourceDataSyncS3Format

    @[JSON::Field(key: "Region")]
    property region : String

    @[JSON::Field(key: "AWSKMSKeyARN")]
    property awskms_key_arn : String | Nil

    @[JSON::Field(key: "DestinationDataSharing")]
    property destination_data_sharing : ResourceDataSyncDestinationDataSharing | Nil

    def initialize(
      @bucket_name : String,
      @sync_format : ResourceDataSyncS3Format,
      @region : String,
      @prefix : String | Nil = nil,
      @awskms_key_arn : String | Nil = nil,
      @destination_data_sharing : ResourceDataSyncDestinationDataSharing | Nil = nil
    )
    end
  end
end
