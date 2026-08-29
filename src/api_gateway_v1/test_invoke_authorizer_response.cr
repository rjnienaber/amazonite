module Amazonite::ApiGatewayV1
  # Represents the response of the test invoke request for a custom Authorizer
  class TestInvokeAuthorizerResponse
    include JSON::Serializable

    # The HTTP status code that the client would have received. Value is 0 if the authorizer
    # succeeded.
    @[JSON::Field(key: "clientStatus")]
    property client_status : Int32 | Nil

    # The API Gateway execution log for the test authorizer request.
    @[JSON::Field(key: "log")]
    property log : String | Nil

    # The execution latency, in ms, of the test authorizer request.
    @[JSON::Field(key: "latency")]
    property latency : Int64 | Nil

    # The principal identity returned by the Authorizer
    @[JSON::Field(key: "principalId")]
    property principal_id : String | Nil

    # The JSON policy document returned by the Authorizer
    @[JSON::Field(key: "policy")]
    property policy : String | Nil

    # The authorization response.
    @[JSON::Field(key: "authorization")]
    property authorization : Hash(String, Array(String)) | Nil

    # The open identity claims, with any supported custom attributes, returned from the Cognito Your
    # User Pool configured for the API.
    @[JSON::Field(key: "claims")]
    property claims : Hash(String, String) | Nil

    def initialize(
      @client_status : Int32 | Nil = nil,
      @log : String | Nil = nil,
      @latency : Int64 | Nil = nil,
      @principal_id : String | Nil = nil,
      @policy : String | Nil = nil,
      @authorization : Hash(String, Array(String)) | Nil = nil,
      @claims : Hash(String, String) | Nil = nil,
    )
    end
  end
end
