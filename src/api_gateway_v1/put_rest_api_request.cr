private alias AAG = Amazonite::ApiGatewayV1

module Amazonite::ApiGatewayV1
  # A PUT request to update an existing API, with external API definitions specified as the request
  # body.
  class PutRestApiRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The `mode` query parameter to specify the update mode. Valid values are "merge" and "overwrite".
    # By default, the update mode is "merge".
    @[JSON::Field(key: "mode", converter: AAG::PutMode, ignore: true)]
    property mode : PutMode | Nil

    # A query parameter to indicate whether to rollback the API update (`true`) or not (`false`) when
    # a warning is encountered. The default value is `false`.
    @[JSON::Field(key: "failOnWarnings", ignore: true)]
    property fail_on_warnings : Bool | Nil

    # Custom header parameters as part of the request. For example, to exclude DocumentationParts from
    # an imported API, set `ignore=documentation` as a `parameters` value, as in the AWS CLI command
    # of `aws apigateway import-rest-api --parameters ignore=documentation --body
    # 'file:///path/to/imported-api-body.json'`.
    @[JSON::Field(key: "parameters")]
    property parameters : Hash(String, String) | Nil

    # The PUT request body containing external API definitions. Currently, only OpenAPI definition
    # JSON/YAML files are supported. The maximum size of the API definition file is 6MB.
    @[JSON::Field(key: "body")]
    property body : String

    def initialize(
      @rest_api_id : String,
      @body : String,
      @mode : PutMode | Nil = nil,
      @fail_on_warnings : Bool | Nil = nil,
      @parameters : Hash(String, String) | Nil = nil,
    )
    end

    def_equals_and_hash(@rest_api_id, @mode, @fail_on_warnings, @parameters, @body)
  end
end
