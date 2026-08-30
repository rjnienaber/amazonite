module Amazonite::ApiGatewayV1
  # Request to delete a Resource.
  class DeleteResourceRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The identifier of the Resource resource.
    @[JSON::Field(key: "resourceId", ignore: true)]
    property resource_id : String = ""

    def initialize(
      @rest_api_id : String,
      @resource_id : String,
    )
    end

    def_equals_and_hash(@rest_api_id, @resource_id)
  end
end
