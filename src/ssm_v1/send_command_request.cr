private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class SendCommandRequest
    include JSON::Serializable

    @[JSON::Field(key: "InstanceIds")]
    property instance_ids : Array(String) | Nil

    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    @[JSON::Field(key: "DocumentName")]
    property document_name : String

    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    @[JSON::Field(key: "DocumentHash")]
    property document_hash : String | Nil

    @[JSON::Field(key: "DocumentHashType", converter: AS::DocumentHashType)]
    property document_hash_type : DocumentHashType | Nil

    @[JSON::Field(key: "TimeoutSeconds")]
    property timeout_seconds : Int32 | Nil

    @[JSON::Field(key: "Comment")]
    property comment : String | Nil

    @[JSON::Field(key: "Parameters")]
    property parameters : Hash(String, Array(String)) | Nil

    @[JSON::Field(key: "OutputS3Region")]
    property output_s3_region : String | Nil

    @[JSON::Field(key: "OutputS3BucketName")]
    property output_s3_bucket_name : String | Nil

    @[JSON::Field(key: "OutputS3KeyPrefix")]
    property output_s3_key_prefix : String | Nil

    @[JSON::Field(key: "MaxConcurrency")]
    property max_concurrency : String | Nil

    @[JSON::Field(key: "MaxErrors")]
    property max_errors : String | Nil

    @[JSON::Field(key: "ServiceRoleArn")]
    property service_role_arn : String | Nil

    @[JSON::Field(key: "NotificationConfig")]
    property notification_config : NotificationConfig | Nil

    @[JSON::Field(key: "CloudWatchOutputConfig")]
    property cloud_watch_output_config : CloudWatchOutputConfig | Nil

    @[JSON::Field(key: "AlarmConfiguration")]
    property alarm_configuration : AlarmConfiguration | Nil

    def initialize(
      @document_name : String,
      @instance_ids : Array(String) | Nil = nil,
      @targets : Array(Target) | Nil = nil,
      @document_version : String | Nil = nil,
      @document_hash : String | Nil = nil,
      @document_hash_type : DocumentHashType | Nil = nil,
      @timeout_seconds : Int32 | Nil = nil,
      @comment : String | Nil = nil,
      @parameters : Hash(String, Array(String)) | Nil = nil,
      @output_s3_region : String | Nil = nil,
      @output_s3_bucket_name : String | Nil = nil,
      @output_s3_key_prefix : String | Nil = nil,
      @max_concurrency : String | Nil = nil,
      @max_errors : String | Nil = nil,
      @service_role_arn : String | Nil = nil,
      @notification_config : NotificationConfig | Nil = nil,
      @cloud_watch_output_config : CloudWatchOutputConfig | Nil = nil,
      @alarm_configuration : AlarmConfiguration | Nil = nil
    )
    end
  end
end
