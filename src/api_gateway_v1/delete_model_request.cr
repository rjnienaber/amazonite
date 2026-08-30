module Amazonite::ApiGatewayV1
  # Request to delete an existing model in an existing RestApi resource.
  class DeleteModelRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The name of the model to delete.
    @[JSON::Field(key: "modelName", ignore: true)]
    property model_name : String = ""

    def initialize(
      @rest_api_id : String,
      @model_name : String,
    )
    end

    def_equals_and_hash(@rest_api_id, @model_name)
  end
end
