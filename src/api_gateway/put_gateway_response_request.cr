private alias AAG = Amazonite::ApiGateway
private alias Core = Amazonite::Core

module Amazonite::ApiGateway
  # Creates a customization of a GatewayResponse of a specified response type and status code on the
  # given RestApi.
  class PutGatewayResponseRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The response type of the associated GatewayResponse
    @[JSON::Field(key: "responseType", converter: AAG::GatewayResponseType, ignore: true)]
    property response_type : GatewayResponseType = AAG::GatewayResponseType::Default4xx

    # The HTTP status code of the GatewayResponse.
    @[JSON::Field(key: "statusCode")]
    property status_code : String | Nil

    # Response parameters (paths, query strings and headers) of the GatewayResponse as a
    # string-to-string map of key-value pairs.
    @[JSON::Field(key: "responseParameters")]
    property response_parameters : Hash(String, String) | Nil

    # Response templates of the GatewayResponse as a string-to-string map of key-value pairs.
    @[JSON::Field(key: "responseTemplates")]
    property response_templates : Hash(String, String) | Nil

    def initialize(
      @rest_api_id : String,
      @response_type : GatewayResponseType,
      @status_code : String | Nil = nil,
      @response_parameters : Hash(String, String) | Nil = nil,
      @response_templates : Hash(String, String) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @status_code
        raise Core::ValidationError.new("statusCode does not match the required pattern") unless value.matches?(Regex.new("^[1-5]\\d\\d$"))
      end
    end

    def_equals_and_hash(@rest_api_id, @response_type, @status_code, @response_parameters, @response_templates)
  end
end
