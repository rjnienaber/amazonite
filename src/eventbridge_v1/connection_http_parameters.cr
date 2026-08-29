module Amazonite::EventBridgeV1
  # Any additional parameters for the connection.
  class ConnectionHttpParameters
    include JSON::Serializable

    # Any additional header parameters for the connection.
    @[JSON::Field(key: "HeaderParameters")]
    property header_parameters : Array(ConnectionHeaderParameter) | Nil

    # Any additional query string parameters for the connection.
    @[JSON::Field(key: "QueryStringParameters")]
    property query_string_parameters : Array(ConnectionQueryStringParameter) | Nil

    # Any additional body string parameters for the connection.
    @[JSON::Field(key: "BodyParameters")]
    property body_parameters : Array(ConnectionBodyParameter) | Nil

    def initialize(
      @header_parameters : Array(ConnectionHeaderParameter) | Nil = nil,
      @query_string_parameters : Array(ConnectionQueryStringParameter) | Nil = nil,
      @body_parameters : Array(ConnectionBodyParameter) | Nil = nil,
    )
    end
  end
end
