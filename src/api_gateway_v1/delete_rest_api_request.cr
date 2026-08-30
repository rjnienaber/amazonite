module Amazonite::ApiGatewayV1
  # Request to delete the specified API from your collection.
  class DeleteRestApiRequest
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
