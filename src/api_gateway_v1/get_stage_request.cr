module Amazonite::ApiGatewayV1
  # Requests API Gateway to get information about a Stage resource.
  class GetStageRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The name of the Stage resource to get information about.
    @[JSON::Field(key: "stageName", ignore: true)]
    property stage_name : String = ""

    def initialize(
      @rest_api_id : String,
      @stage_name : String,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@rest_api_id, @stage_name)
  end
end
