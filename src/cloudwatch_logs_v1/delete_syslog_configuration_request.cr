private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @log_group_identifier
        raise Core::ValidationError.new("logGroupIdentifier length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logGroupIdentifier length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("logGroupIdentifier does not match the required pattern") unless value.matches?(Regex.new("^[\\w#+=/:,.@-]*$"))
      end

      if value = @vpc_endpoint_id
        raise Core::ValidationError.new("vpcEndpointId does not match the required pattern") unless value.matches?(Regex.new("^vpce-[0-9a-f]{1,64}$"))
      end
    end

    def_equals_and_hash(@log_group_identifier, @vpc_endpoint_id)
  end
end
