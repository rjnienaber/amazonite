module Amazonite::ApiGateway
  # A set of validation rules for incoming Method requests.
  class RequestValidator
    include JSON::Serializable

    # The identifier of this RequestValidator.
    @[JSON::Field(key: "id")]
    property id : String | Nil

    # The name of this RequestValidator
    @[JSON::Field(key: "name")]
    property name : String | Nil

    # A Boolean flag to indicate whether to validate a request body according to the configured Model
    # schema.
    @[JSON::Field(key: "validateRequestBody")]
    property validate_request_body : Bool | Nil

    # A Boolean flag to indicate whether to validate request parameters (`true`) or not (`false`).
    @[JSON::Field(key: "validateRequestParameters")]
    property validate_request_parameters : Bool | Nil

    def initialize(
      @id : String | Nil = nil,
      @name : String | Nil = nil,
      @validate_request_body : Bool | Nil = nil,
      @validate_request_parameters : Bool | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@id, @name, @validate_request_body, @validate_request_parameters)
  end
end
