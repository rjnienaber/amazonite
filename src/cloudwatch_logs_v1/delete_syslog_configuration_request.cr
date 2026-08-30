module Amazonite::CloudWatchLogsV1
  class DeleteSyslogConfigurationRequest
    include JSON::Serializable

    # The name or ARN of the log group to remove the syslog configuration from.
    @[JSON::Field(key: "logGroupIdentifier")]
    property log_group_identifier : String

    # The ID of the VPC endpoint associated with the syslog configuration to delete.
    @[JSON::Field(key: "vpcEndpointId")]
    property vpc_endpoint_id : String | Nil

    def initialize(
      @log_group_identifier : String,
      @vpc_endpoint_id : String | Nil = nil,
    )
    end
  end
end
