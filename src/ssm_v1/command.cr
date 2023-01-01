private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class Command
    include JSON::Serializable

    @[JSON::Field(key: "CommandId")]
    property command_id : String | Nil

    @[JSON::Field(key: "DocumentName")]
    property document_name : String | Nil

    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    @[JSON::Field(key: "Comment")]
    property comment : String | Nil

    @[JSON::Field(key: "ExpiresAfter", converter: Core::AWSEpochConverter)]
    property expires_after : Time | Nil

    @[JSON::Field(key: "Parameters")]
    property parameters : Hash(String, Array(String)) | Nil

    @[JSON::Field(key: "InstanceIds")]
    property instance_ids : Array(String) | Nil

    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    @[JSON::Field(key: "RequestedDateTime", converter: Core::AWSEpochConverter)]
    property requested_date_time : Time | Nil

    @[JSON::Field(key: "Status", converter: AS::CommandStatus)]
    property status : CommandStatus | Nil

    @[JSON::Field(key: "StatusDetails")]
    property status_details : String | Nil

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

    @[JSON::Field(key: "TargetCount")]
    property target_count : Int32 | Nil

    @[JSON::Field(key: "CompletedCount")]
    property completed_count : Int32 | Nil

    @[JSON::Field(key: "ErrorCount")]
    property error_count : Int32 | Nil

    @[JSON::Field(key: "DeliveryTimedOutCount")]
    property delivery_timed_out_count : Int32 | Nil

    @[JSON::Field(key: "ServiceRole")]
    property service_role : String | Nil

    @[JSON::Field(key: "NotificationConfig")]
    property notification_config : NotificationConfig | Nil

    @[JSON::Field(key: "CloudWatchOutputConfig")]
    property cloud_watch_output_config : CloudWatchOutputConfig | Nil

    @[JSON::Field(key: "TimeoutSeconds")]
    property timeout_seconds : Int32 | Nil

    @[JSON::Field(key: "AlarmConfiguration")]
    property alarm_configuration : AlarmConfiguration | Nil

    @[JSON::Field(key: "TriggeredAlarms")]
    property triggered_alarms : Array(AlarmStateInformation) | Nil

    def initialize(
      @command_id : String | Nil = nil,
      @document_name : String | Nil = nil,
      @document_version : String | Nil = nil,
      @comment : String | Nil = nil,
      @expires_after : Time | Nil = nil,
      @parameters : Hash(String, Array(String)) | Nil = nil,
      @instance_ids : Array(String) | Nil = nil,
      @targets : Array(Target) | Nil = nil,
      @requested_date_time : Time | Nil = nil,
      @status : CommandStatus | Nil = nil,
      @status_details : String | Nil = nil,
      @output_s3_region : String | Nil = nil,
      @output_s3_bucket_name : String | Nil = nil,
      @output_s3_key_prefix : String | Nil = nil,
      @max_concurrency : String | Nil = nil,
      @max_errors : String | Nil = nil,
      @target_count : Int32 | Nil = nil,
      @completed_count : Int32 | Nil = nil,
      @error_count : Int32 | Nil = nil,
      @delivery_timed_out_count : Int32 | Nil = nil,
      @service_role : String | Nil = nil,
      @notification_config : NotificationConfig | Nil = nil,
      @cloud_watch_output_config : CloudWatchOutputConfig | Nil = nil,
      @timeout_seconds : Int32 | Nil = nil,
      @alarm_configuration : AlarmConfiguration | Nil = nil,
      @triggered_alarms : Array(AlarmStateInformation) | Nil = nil
    )
    end
  end
end
