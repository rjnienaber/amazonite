module Amazonite::ApiGatewayV1
  # The GET request to list an existing RestApi defined for your collection.
  class GetRestApiRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    def initialize(
      @rest_api_id : String,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@rest_api_id)
  end
end
