private alias AAG = Amazonite::ApiGateway

module Amazonite::ApiGateway
  # Gets a GatewayResponse of a specified response type on the given RestApi.
  class GetGatewayResponseRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The response type of the associated GatewayResponse.
    @[JSON::Field(key: "responseType", converter: AAG::GatewayResponseType, ignore: true)]
    property response_type : GatewayResponseType = AAG::GatewayResponseType::Default4xx

    def initialize(
      @rest_api_id : String,
      @response_type : GatewayResponseType,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@rest_api_id, @response_type)
  end
end
