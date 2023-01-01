private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class MaintenanceWindowRunCommandParameters
    include JSON::Serializable

    @[JSON::Field(key: "Comment")]
    property comment : String | Nil

    @[JSON::Field(key: "CloudWatchOutputConfig")]
    property cloud_watch_output_config : CloudWatchOutputConfig | Nil

    @[JSON::Field(key: "DocumentHash")]
    property document_hash : String | Nil

    @[JSON::Field(key: "DocumentHashType", converter: AS::DocumentHashType)]
    property document_hash_type : DocumentHashType | Nil

    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    @[JSON::Field(key: "NotificationConfig")]
    property notification_config : NotificationConfig | Nil

    @[JSON::Field(key: "OutputS3BucketName")]
    property output_s3_bucket_name : String | Nil

    @[JSON::Field(key: "OutputS3KeyPrefix")]
    property output_s3_key_prefix : String | Nil

    @[JSON::Field(key: "Parameters")]
    property parameters : Hash(String, Array(String)) | Nil

    @[JSON::Field(key: "ServiceRoleArn")]
    property service_role_arn : String | Nil

    @[JSON::Field(key: "TimeoutSeconds")]
    property timeout_seconds : Int32 | Nil

    def initialize(
      @comment : String | Nil = nil,
      @cloud_watch_output_config : CloudWatchOutputConfig | Nil = nil,
      @document_hash : String | Nil = nil,
      @document_hash_type : DocumentHashType | Nil = nil,
      @document_version : String | Nil = nil,
      @notification_config : NotificationConfig | Nil = nil,
      @output_s3_bucket_name : String | Nil = nil,
      @output_s3_key_prefix : String | Nil = nil,
      @parameters : Hash(String, Array(String)) | Nil = nil,
      @service_role_arn : String | Nil = nil,
      @timeout_seconds : Int32 | Nil = nil
    )
    end
  end
end
