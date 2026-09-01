module Amazonite::ApiGateway
  # Creates a RequestValidator of a given RestApi.
  class CreateRequestValidatorRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The name of the to-be-created RequestValidator.
    @[JSON::Field(key: "name")]
    property name : String | Nil

    # A Boolean flag to indicate whether to validate request body according to the configured model
    # schema for the method (`true`) or not (`false`).
    @[JSON::Field(key: "validateRequestBody")]
    property validate_request_body : Bool | Nil

    # A Boolean flag to indicate whether to validate request parameters, `true`, or not `false`.
    @[JSON::Field(key: "validateRequestParameters")]
    property validate_request_parameters : Bool | Nil

    def initialize(
      @rest_api_id : String,
      @name : String | Nil = nil,
      @validate_request_body : Bool | Nil = nil,
      @validate_request_parameters : Bool | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@rest_api_id, @name, @validate_request_body, @validate_request_parameters)
  end
end
