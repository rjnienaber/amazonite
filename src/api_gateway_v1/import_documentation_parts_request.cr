private alias AAG = Amazonite::ApiGatewayV1

module Amazonite::ApiGatewayV1
  # Import documentation parts from an external (e.g., OpenAPI) definition file.
  class ImportDocumentationPartsRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # A query parameter to indicate whether to overwrite (`overwrite`) any existing DocumentationParts
    # definition or to merge (`merge`) the new definition into the existing one. The default value is
    # `merge`.
    @[JSON::Field(key: "mode", converter: AAG::PutMode, ignore: true)]
    property mode : PutMode | Nil

    # A query parameter to specify whether to rollback the documentation importation (`true`) or not
    # (`false`) when a warning is encountered. The default value is `false`.
    @[JSON::Field(key: "failOnWarnings", ignore: true)]
    property fail_on_warnings : Bool | Nil

    # Raw byte array representing the to-be-imported documentation parts. To import from an OpenAPI
    # file, this is a JSON object.
    @[JSON::Field(key: "body")]
    property body : String

    def initialize(
      @rest_api_id : String,
      @body : String,
      @mode : PutMode | Nil = nil,
      @fail_on_warnings : Bool | Nil = nil,
    )
    end
  end
end
