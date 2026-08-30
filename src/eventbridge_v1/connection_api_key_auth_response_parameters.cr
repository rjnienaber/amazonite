module Amazonite::EventBridgeV1
  # Contains the authorization parameters for the connection if API Key is specified as the
  # authorization type.
  class ConnectionApiKeyAuthResponseParameters
    include JSON::Serializable

    # The name of the header to use for the `APIKeyValue` used for authorization.
    @[JSON::Field(key: "ApiKeyName")]
    property api_key_name : String | Nil

    def initialize(
      @api_key_name : String | Nil = nil,
    )
    end

    def_equals_and_hash(@api_key_name)
  end
end
