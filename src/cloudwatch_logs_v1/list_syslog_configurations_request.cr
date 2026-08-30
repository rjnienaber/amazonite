private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @log_group_identifier
        raise Core::ValidationError.new("logGroupIdentifier length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logGroupIdentifier length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("logGroupIdentifier does not match the required pattern") unless value.matches?(Regex.new("^[\\w#+=/:,.@-]*$"))
      end

      if value = @vpc_endpoint_id
        raise Core::ValidationError.new("vpcEndpointId does not match the required pattern") unless value.matches?(Regex.new("^vpce-[0-9a-f]{1,64}$"))
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end

      if value = @max_results
        raise Core::ValidationError.new("maxResults value must be >= 0") if value < 0
        raise Core::ValidationError.new("maxResults value must be <= 50") if value > 50
      end
    end

    def_equals_and_hash(@log_group_identifier, @vpc_endpoint_id, @next_token, @max_results)
  end
end
