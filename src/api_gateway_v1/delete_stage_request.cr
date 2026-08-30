module Amazonite::ApiGatewayV1
  # Requests API Gateway to delete a Stage resource.
  class DeleteStageRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The name of the Stage resource to delete.
    @[JSON::Field(key: "stageName", ignore: true)]
    property stage_name : String = ""

    def initialize(
      @rest_api_id : String,
      @stage_name : String,
    )
    end

    def_equals_and_hash(@rest_api_id, @stage_name)
  end
end
