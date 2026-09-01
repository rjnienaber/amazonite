private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class PutBearerTokenAuthenticationRequest
    include JSON::Serializable

    # The name or ARN of the log group.
    #
    # Type: String
    #
    # Length Constraints: Minimum length of 1. Maximum length of 512.
    #
    # Pattern: `[\.\-_/#A-Za-z0-9]+`
    #
    # Required: Yes
    @[JSON::Field(key: "logGroupIdentifier")]
    property log_group_identifier : String

    # Whether to enable bearer token authentication.
    #
    # Type: Boolean
    #
    # Required: Yes
    @[JSON::Field(key: "bearerTokenAuthenticationEnabled")]
    property bearer_token_authentication_enabled : Bool

    def initialize(
      @log_group_identifier : String,
      @bearer_token_authentication_enabled : Bool,
    )
    end

    def validate! : Nil
      if value = @log_group_identifier
        raise Core::ValidationError.new("logGroupIdentifier length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logGroupIdentifier length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("logGroupIdentifier does not match the required pattern") unless value.matches?(Regex.new("^[\\w#+=/:,.@-]*$"))
      end
    end

    def_equals_and_hash(@log_group_identifier, @bearer_token_authentication_enabled)
  end
end
