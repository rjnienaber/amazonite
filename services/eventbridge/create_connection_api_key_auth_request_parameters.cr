private alias Core = Amazonite::Core

module Amazonite::EventBridge
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

    def validate! : Nil
      if value = @api_key_name
        raise Core::ValidationError.new("ApiKeyName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ApiKeyName length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("ApiKeyName does not match the required pattern") unless value.matches?(Regex.new("^[ \\t]*[^\\x00-\\x1F:\\x7F]+([ \\t]+[^\\x00-\\x1F:\\x7F]+)*[ \\t]*$"))
      end

      if value = @api_key_value
        raise Core::ValidationError.new("ApiKeyValue length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ApiKeyValue length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("ApiKeyValue does not match the required pattern") unless value.matches?(Regex.new("^[ \\t]*[^\\x00-\\x1F:\\x7F]+([ \\t]+[^\\x00-\\x1F:\\x7F]+)*[ \\t]*$"))
      end
    end

    def_equals_and_hash(@api_key_name, @api_key_value)
  end
end
