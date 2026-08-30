private alias AAG = Amazonite::ApiGatewayV1

module Amazonite::ApiGatewayV1
  # The POST request to import API keys from an external source, such as a CSV-formatted file.
  class ImportApiKeysRequest
    include JSON::Serializable

    # The payload of the POST request to import API keys. For the payload format, see API Key File
    # Format.
    @[JSON::Field(key: "body")]
    property body : String

    # A query parameter to specify the input format to imported API keys. Currently, only the `csv`
    # format is supported.
    @[JSON::Field(key: "format", converter: AAG::ApiKeysFormat, ignore: true)]
    property format : ApiKeysFormat = AAG::ApiKeysFormat::Csv

    # A query parameter to indicate whether to rollback ApiKey importation (`true`) or not (`false`)
    # when error is encountered.
    @[JSON::Field(key: "failOnWarnings", ignore: true)]
    property fail_on_warnings : Bool | Nil

    def initialize(
      @body : String,
      @format : ApiKeysFormat,
      @fail_on_warnings : Bool | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@body, @format, @fail_on_warnings)
  end
end
