module Amazonite::ApiGateway
  # Request to describe an existing Authorizer resource.
  class GetAuthorizerRequest
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

    def validate! : Nil
    end

    def_equals_and_hash(@rest_api_id, @authorizer_id)
  end
end
