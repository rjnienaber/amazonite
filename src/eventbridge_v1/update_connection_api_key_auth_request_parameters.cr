module Amazonite::EventBridgeV1
  # Contains the API key authorization parameters to use to update the connection.
  class UpdateConnectionApiKeyAuthRequestParameters
    include JSON::Serializable

    # The name of the API key to use for authorization.
    @[JSON::Field(key: "ApiKeyName")]
    property api_key_name : String | Nil

    # The value associated with the API key to use for authorization.
    @[JSON::Field(key: "ApiKeyValue")]
    property api_key_value : String | Nil

    def initialize(
      @api_key_name : String | Nil = nil,
      @api_key_value : String | Nil = nil,
    )
    end

    def_equals_and_hash(@api_key_name, @api_key_value)
  end
end
