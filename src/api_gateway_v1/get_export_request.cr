module Amazonite::ApiGatewayV1
  # Request a new export of a RestApi for a particular Stage.
  class GetExportRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The name of the Stage that will be exported.
    @[JSON::Field(key: "stageName", ignore: true)]
    property stage_name : String = ""

    # The type of export. Acceptable values are 'oas30' for OpenAPI 3.0.x and 'swagger' for
    # Swagger/OpenAPI 2.0.
    @[JSON::Field(key: "exportType", ignore: true)]
    property export_type : String = ""

    # A key-value map of query string parameters that specify properties of the export, depending on
    # the requested `exportType`. For `exportType` `oas30` and `swagger`, any combination of the
    # following parameters are supported: `extensions='integrations'` or `extensions='apigateway'`
    # will export the API with x-amazon-apigateway-integration extensions. `extensions='authorizers'`
    # will export the API with x-amazon-apigateway-authorizer extensions. `postman` will export the
    # API with Postman extensions, allowing for import to the Postman tool
    @[JSON::Field(key: "parameters")]
    property parameters : Hash(String, String) | Nil

    # The content-type of the export, for example `application/json`. Currently `application/json` and
    # `application/yaml` are supported for `exportType` of`oas30` and `swagger`. This should be
    # specified in the `Accept` header for direct API requests.
    @[JSON::Field(key: "accepts", ignore: true)]
    property accepts : String | Nil

    def initialize(
      @rest_api_id : String,
      @stage_name : String,
      @export_type : String,
      @parameters : Hash(String, String) | Nil = nil,
      @accepts : String | Nil = nil,
    )
    end
  end
end
