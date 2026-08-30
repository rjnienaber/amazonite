private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class GetDataProtectionPolicyRequest
    include JSON::Serializable

    # The name or ARN of the log group that contains the data protection policy that you want to see.
    @[JSON::Field(key: "logGroupIdentifier")]
    property log_group_identifier : String

    def initialize(
      @log_group_identifier : String,
    )
    end

    def validate! : Nil
      if value = @log_group_identifier
        raise Core::ValidationError.new("logGroupIdentifier length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logGroupIdentifier length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("logGroupIdentifier does not match the required pattern") unless value.matches?(Regex.new("^[\\w#+=/:,.@-]*$"))
      end
    end

    def_equals_and_hash(@log_group_identifier)
  end
end
