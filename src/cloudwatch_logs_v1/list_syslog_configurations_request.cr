module Amazonite::CloudWatchLogsV1
  class ListSyslogConfigurationsRequest
    include JSON::Serializable

    # The name or ARN of the log group to filter syslog configurations for.
    @[JSON::Field(key: "logGroupIdentifier")]
    property log_group_identifier : String | Nil

    # The ID of the VPC endpoint to filter syslog configurations for.
    @[JSON::Field(key: "vpcEndpointId")]
    property vpc_endpoint_id : String | Nil

    # The token for the next set of items to return. You received this token from a previous call.
    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    # The maximum number of syslog configurations to return in the response.
    @[JSON::Field(key: "maxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @log_group_identifier : String | Nil = nil,
      @vpc_endpoint_id : String | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def_equals_and_hash(@log_group_identifier, @vpc_endpoint_id, @next_token, @max_results)
  end
end
