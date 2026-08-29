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
  end
end
