private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @header_parameters
        raise Core::ValidationError.new("HeaderParameters must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("HeaderParameters must have at most 100 item(s)") if value.size > 100
        value.each(&.validate!)
      end

      if value = @query_string_parameters
        raise Core::ValidationError.new("QueryStringParameters must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("QueryStringParameters must have at most 100 item(s)") if value.size > 100
        value.each(&.validate!)
      end

      if value = @body_parameters
        raise Core::ValidationError.new("BodyParameters must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("BodyParameters must have at most 100 item(s)") if value.size > 100
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@header_parameters, @query_string_parameters, @body_parameters)
  end
end
