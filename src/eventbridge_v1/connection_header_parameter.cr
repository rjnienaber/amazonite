private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  # Additional parameter included in the header. You can include up to 100 additional header
  # parameters per request. An event payload cannot exceed 64 KB.
  class ConnectionHeaderParameter
    include JSON::Serializable

    # The key for the parameter.
    @[JSON::Field(key: "Key")]
    property key : String | Nil

    # The value associated with the key.
    @[JSON::Field(key: "Value")]
    property value : String | Nil

    # Specifies whether the value is a secret.
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
        raise Core::ValidationError.new("Key does not match the required pattern") unless value.matches?(Regex.new("^[!#$%&'*+-.^_`|~0-9a-zA-Z]+$"))
      end

      if value = @value
        raise Core::ValidationError.new("Value length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Value length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("Value does not match the required pattern") unless value.matches?(Regex.new("^[ \\t]*[\\x20-\\x7E]+([ \\t]+[\\x20-\\x7E]+)*[ \\t]*$"))
      end
    end

    def_equals_and_hash(@key, @value, @is_value_secret)
  end
end
