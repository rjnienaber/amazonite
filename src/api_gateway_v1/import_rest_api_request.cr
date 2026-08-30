module Amazonite::ApiGatewayV1
  # A POST request to import an API to API Gateway using an input of an API definition file.
  class ImportRestApiRequest
    include JSON::Serializable

    # A query parameter to indicate whether to rollback the API creation (`true`) or not (`false`)
    # when a warning is encountered. The default value is `false`.
    @[JSON::Field(key: "failOnWarnings", ignore: true)]
    property fail_on_warnings : Bool | Nil

    # A key-value map of context-specific query string parameters specifying the behavior of different
    # API importing operations. The following shows operation-specific parameters and their supported
    # values.
    #
    # To exclude DocumentationParts from the import, set `parameters` as `ignore=documentation`.
    #
    # To configure the endpoint type, set `parameters` as `endpointConfigurationTypes=EDGE`,
    # `endpointConfigurationTypes=REGIONAL`, or `endpointConfigurationTypes=PRIVATE`. The default
    # endpoint type is `EDGE`.
    #
    # To handle imported `basepath`, set `parameters` as `basepath=ignore`, `basepath=prepend` or
    # `basepath=split`.
    @[JSON::Field(key: "parameters")]
    property parameters : Hash(String, String) | Nil

    # The POST request body containing external API definitions. Currently, only OpenAPI definition
    # JSON/YAML files are supported. The maximum size of the API definition file is 6MB.
    @[JSON::Field(key: "body")]
    property body : String

    def initialize(
      @body : String,
      @fail_on_warnings : Bool | Nil = nil,
      @parameters : Hash(String, String) | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@fail_on_warnings, @parameters, @body)
  end
end
