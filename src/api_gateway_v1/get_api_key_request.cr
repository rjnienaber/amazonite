module Amazonite::ApiGatewayV1
  # A request to get information about the current ApiKey resource.
  class GetApiKeyRequest
    include JSON::Serializable

    # The identifier of the ApiKey resource.
    @[JSON::Field(key: "apiKey", ignore: true)]
    property api_key : String = ""

    # A boolean flag to specify whether (`true`) or not (`false`) the result contains the key value.
    @[JSON::Field(key: "includeValue", ignore: true)]
    property include_value : Bool | Nil

    def initialize(
      @api_key : String,
      @include_value : Bool | Nil = nil,
    )
    end

    def_equals_and_hash(@api_key, @include_value)
  end
end
