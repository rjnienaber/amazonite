private alias Core = Amazonite::Core

module Amazonite::ApiGateway
  # Represents an AWS account that is associated with API Gateway.
  class Account
    include JSON::Serializable

    # The ARN of an Amazon CloudWatch role for the current Account.
    @[JSON::Field(key: "cloudwatchRoleArn")]
    property cloudwatch_role_arn : String | Nil

    # Specifies the API request limits configured for the current Account.
    @[JSON::Field(key: "throttleSettings")]
    property throttle_settings : ThrottleSettings | Nil

    # A list of features supported for the account. When usage plans are enabled, the features list
    # will include an entry of `"UsagePlans"`.
    @[JSON::Field(key: "features")]
    property features : Array(String) | Nil

    # The version of the API keys used for the account.
    @[JSON::Field(key: "apiKeyVersion")]
    property api_key_version : String | Nil

    def initialize(
      @cloudwatch_role_arn : String | Nil = nil,
      @throttle_settings : ThrottleSettings | Nil = nil,
      @features : Array(String) | Nil = nil,
      @api_key_version : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @throttle_settings
        value.validate!
      end
    end

    def_equals_and_hash(@cloudwatch_role_arn, @throttle_settings, @features, @api_key_version)
  end
end
