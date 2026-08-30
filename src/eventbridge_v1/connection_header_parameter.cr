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
  end
end
