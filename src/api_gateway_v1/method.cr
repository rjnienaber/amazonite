module Amazonite::ApiGatewayV1
  # Represents a client-facing interface by which the client calls the API to access back-end
  # resources. A Method resource is integrated with an Integration resource. Both consist of a
  # request and one or more responses. The method request takes the client input that is passed to
  # the back end through the integration request. A method response returns the output from the back
  # end to the client through an integration response. A method request is embodied in a Method
  # resource, whereas an integration request is embodied in an Integration resource. On the other
  # hand, a method response is represented by a MethodResponse resource, whereas an integration
  # response is represented by an IntegrationResponse resource.
  class Method
    include JSON::Serializable

    # The method's HTTP verb.
    @[JSON::Field(key: "httpMethod")]
    property http_method : String | Nil

    # The method's authorization type. Valid values are `NONE` for open access, `AWS_IAM` for using
    # AWS IAM permissions, `CUSTOM` for using a custom authorizer, or `COGNITO_USER_POOLS` for using a
    # Cognito user pool.
    @[JSON::Field(key: "authorizationType")]
    property authorization_type : String | Nil

    # The identifier of an Authorizer to use on this method. The `authorizationType` must be `CUSTOM`.
    @[JSON::Field(key: "authorizerId")]
    property authorizer_id : String | Nil

    # A boolean flag specifying whether a valid ApiKey is required to invoke this method.
    @[JSON::Field(key: "apiKeyRequired")]
    property api_key_required : Bool | Nil

    # The identifier of a RequestValidator for request validation.
    @[JSON::Field(key: "requestValidatorId")]
    property request_validator_id : String | Nil

    # A human-friendly operation identifier for the method. For example, you can assign the
    # `operationName` of `ListPets` for the `GET /pets` method in the `PetStore` example.
    @[JSON::Field(key: "operationName")]
    property operation_name : String | Nil

    # A key-value map defining required or optional method request parameters that can be accepted by
    # API Gateway. A key is a method request parameter name matching the pattern of
    # `method.request.{location}.{name}`, where `location` is `querystring`, `path`, or `header` and
    # `name` is a valid and unique parameter name. The value associated with the key is a Boolean flag
    # indicating whether the parameter is required (`true`) or optional (`false`). The method request
    # parameter names defined here are available in Integration to be mapped to integration request
    # parameters or templates.
    @[JSON::Field(key: "requestParameters")]
    property request_parameters : Hash(String, Bool) | Nil

    # A key-value map specifying data schemas, represented by Model resources, (as the mapped value)
    # of the request payloads of given content types (as the mapping key).
    @[JSON::Field(key: "requestModels")]
    property request_models : Hash(String, String) | Nil

    # Gets a method response associated with a given HTTP status code.
    @[JSON::Field(key: "methodResponses")]
    property method_responses : Hash(String, MethodResponse) | Nil

    # Gets the method's integration responsible for passing the client-submitted request to the back
    # end and performing necessary transformations to make the request compliant with the back end.
    @[JSON::Field(key: "methodIntegration")]
    property method_integration : Integration | Nil

    # A list of authorization scopes configured on the method. The scopes are used with a
    # `COGNITO_USER_POOLS` authorizer to authorize the method invocation. The authorization works by
    # matching the method scopes against the scopes parsed from the access token in the incoming
    # request. The method invocation is authorized if any method scopes matches a claimed scope in the
    # access token. Otherwise, the invocation is not authorized. When the method scope is configured,
    # the client must provide an access token instead of an identity token for authorization purposes.
    @[JSON::Field(key: "authorizationScopes")]
    property authorization_scopes : Array(String) | Nil

    def initialize(
      @http_method : String | Nil = nil,
      @authorization_type : String | Nil = nil,
      @authorizer_id : String | Nil = nil,
      @api_key_required : Bool | Nil = nil,
      @request_validator_id : String | Nil = nil,
      @operation_name : String | Nil = nil,
      @request_parameters : Hash(String, Bool) | Nil = nil,
      @request_models : Hash(String, String) | Nil = nil,
      @method_responses : Hash(String, MethodResponse) | Nil = nil,
      @method_integration : Integration | Nil = nil,
      @authorization_scopes : Array(String) | Nil = nil,
    )
    end
  end
end
