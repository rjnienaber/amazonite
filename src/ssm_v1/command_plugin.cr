private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class CommandPlugin
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "Status", converter: AS::CommandPluginStatus)]
    property status : CommandPluginStatus | Nil

    @[JSON::Field(key: "StatusDetails")]
    property status_details : String | Nil

    @[JSON::Field(key: "ResponseCode")]
    property response_code : Int32 | Nil

    @[JSON::Field(key: "ResponseStartDateTime", converter: Core::AWSEpochConverter)]
    property response_start_date_time : Time | Nil

    @[JSON::Field(key: "ResponseFinishDateTime", converter: Core::AWSEpochConverter)]
    property response_finish_date_time : Time | Nil

    @[JSON::Field(key: "Output")]
    property output : String | Nil

    @[JSON::Field(key: "StandardOutputUrl")]
    property standard_output_url : String | Nil

    @[JSON::Field(key: "StandardErrorUrl")]
    property standard_error_url : String | Nil

    @[JSON::Field(key: "OutputS3Region")]
    property output_s3_region : String | Nil

    @[JSON::Field(key: "OutputS3BucketName")]
    property output_s3_bucket_name : String | Nil

    @[JSON::Field(key: "OutputS3KeyPrefix")]
    property output_s3_key_prefix : String | Nil

    def initialize(
      @name : String | Nil = nil,
      @status : CommandPluginStatus | Nil = nil,
      @status_details : String | Nil = nil,
      @response_code : Int32 | Nil = nil,
      @response_start_date_time : Time | Nil = nil,
      @response_finish_date_time : Time | Nil = nil,
      @output : String | Nil = nil,
      @standard_output_url : String | Nil = nil,
      @standard_error_url : String | Nil = nil,
      @output_s3_region : String | Nil = nil,
      @output_s3_bucket_name : String | Nil = nil,
      @output_s3_key_prefix : String | Nil = nil
    )
    end
  end
end
