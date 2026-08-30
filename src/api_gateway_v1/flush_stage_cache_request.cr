module Amazonite::ApiGatewayV1
  # Requests API Gateway to flush a stage's cache.
  class FlushStageCacheRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The name of the stage to flush its cache.
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
