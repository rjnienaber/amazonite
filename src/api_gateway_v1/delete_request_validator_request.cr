module Amazonite::ApiGatewayV1
  # Deletes a specified RequestValidator of a given RestApi.
  class DeleteRequestValidatorRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The identifier of the RequestValidator to be deleted.
    @[JSON::Field(key: "requestValidatorId", ignore: true)]
    property request_validator_id : String = ""

    def initialize(
      @rest_api_id : String,
      @request_validator_id : String,
    )
    end

    def_equals_and_hash(@rest_api_id, @request_validator_id)
  end
end
