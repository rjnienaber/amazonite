module Amazonite::EventBridgeV1
  # The API key authorization parameters for the connection.
  class CreateConnectionApiKeyAuthRequestParameters
    include JSON::Serializable

    # The name of the API key to use for authorization.
    @[JSON::Field(key: "ApiKeyName")]
    property api_key_name : String

    # The value for the API key to use for authorization.
    @[JSON::Field(key: "ApiKeyValue")]
    property api_key_value : String

    def initialize(
      @api_key_name : String,
      @api_key_value : String,
    )
    end

    def_equals_and_hash(@api_key_name, @api_key_value)
  end
end
