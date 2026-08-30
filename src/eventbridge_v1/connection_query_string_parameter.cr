private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  # Any additional query string parameter for the connection. You can include up to 100 additional
  # query string parameters per request. Each additional parameter counts towards the event payload
  # size, which cannot exceed 64 KB.
  class ConnectionQueryStringParameter
    include JSON::Serializable

    # The key for a query string parameter.
    @[JSON::Field(key: "Key")]
    property key : String | Nil

    # The value associated with the key for the query string parameter.
    @[JSON::Field(key: "Value")]
    property value : String | Nil

    # Specifies whether the value is secret.
    @[JSON::Field(key: "IsValueSecret")]
    property is_value_secret : Bool | Nil

    def initialize(
      @key : String | Nil = nil,
      @value : String | Nil = nil,
      @is_value_secret : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @key
        raise Core::ValidationError.new("Key length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Key length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("Key does not match the required pattern") unless value.matches?(Regex.new("^[^\\x00-\\x1F\\x7F]+$"))
      end

      if value = @value
        raise Core::ValidationError.new("Value length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Value length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("Value does not match the required pattern") unless value.matches?(Regex.new("^[^\\x00-\\x09\\x0B\\x0C\\x0E-\\x1F\\x7F]+$"))
      end
    end

    def_equals_and_hash(@key, @value, @is_value_secret)
  end
end
