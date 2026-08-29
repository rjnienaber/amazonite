module Amazonite::ApiGatewayV1
  # Request to delete an existing Authorizer resource.
  class DeleteAuthorizerRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The identifier of the Authorizer resource.
    @[JSON::Field(key: "authorizerId", ignore: true)]
    property authorizer_id : String = ""

    def initialize(
      @rest_api_id : String,
      @authorizer_id : String,
    )
    end
  end
end
