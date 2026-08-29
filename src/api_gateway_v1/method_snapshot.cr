module Amazonite::ApiGatewayV1
  # Represents a summary of a Method resource, given a particular date and time.
  class MethodSnapshot
    include JSON::Serializable

    # The method's authorization type. Valid values are `NONE` for open access, `AWS_IAM` for using
    # AWS IAM permissions, `CUSTOM` for using a custom authorizer, or `COGNITO_USER_POOLS` for using a
    # Cognito user pool.
    @[JSON::Field(key: "authorizationType")]
    property authorization_type : String | Nil

    # Specifies whether the method requires a valid ApiKey.
    @[JSON::Field(key: "apiKeyRequired")]
    property api_key_required : Bool | Nil

    def initialize(
      @authorization_type : String | Nil = nil,
      @api_key_required : Bool | Nil = nil,
    )
    end
  end
end
