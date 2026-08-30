private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  # Contains information about a syslog configuration associated with a log group.
  class SyslogConfiguration
    include JSON::Serializable

    # The ARN of the log group associated with this syslog configuration.
    @[JSON::Field(key: "logGroupArn")]
    property log_group_arn : String | Nil

    # The source type for the syslog configuration.
    @[JSON::Field(key: "sourceType", converter: ACWL::SyslogSourceType)]
    property source_type : SyslogSourceType | Nil

    # The ID of the VPC endpoint used for syslog ingestion.
    @[JSON::Field(key: "vpcEndpointId")]
    property vpc_endpoint_id : String | Nil

    # The time when the syslog configuration was created, expressed as the number of milliseconds
    # after `Jan 1, 1970 00:00:00 UTC`.
    @[JSON::Field(key: "createdAt")]
    property created_at : Int64 | Nil

    def initialize(
      @log_group_arn : String | Nil = nil,
      @source_type : SyslogSourceType | Nil = nil,
      @vpc_endpoint_id : String | Nil = nil,
      @created_at : Int64 | Nil = nil,
    )
    end

    def_equals_and_hash(@log_group_arn, @source_type, @vpc_endpoint_id, @created_at)
  end
end
