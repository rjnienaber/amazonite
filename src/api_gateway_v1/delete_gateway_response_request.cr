private alias AAG = Amazonite::ApiGatewayV1

module Amazonite::ApiGatewayV1
  # Clears any customization of a GatewayResponse of a specified response type on the given RestApi
  # and resets it with the default settings.
  class DeleteGatewayResponseRequest
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
  end
end
