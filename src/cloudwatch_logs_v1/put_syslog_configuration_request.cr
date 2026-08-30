module Amazonite::CloudWatchLogsV1
  class PutSyslogConfigurationRequest
    include JSON::Serializable

    # The name or ARN of the log group to associate with the syslog configuration.
    @[JSON::Field(key: "logGroupIdentifier")]
    property log_group_identifier : String

    # The ID of the VPC endpoint to use for syslog ingestion.
    @[JSON::Field(key: "vpcEndpointId")]
    property vpc_endpoint_id : String | Nil

    def initialize(
      @log_group_identifier : String,
      @vpc_endpoint_id : String | Nil = nil,
    )
    end

    def_equals_and_hash(@log_group_identifier, @vpc_endpoint_id)
  end
end
