module Amazonite::ApiGatewayV1
  # A request to delete the ApiKey resource.
  class DeleteApiKeyRequest
    include JSON::Serializable

    # The identifier of the ApiKey resource to be deleted.
    @[JSON::Field(key: "apiKey", ignore: true)]
    property api_key : String = ""

    def initialize(
      @api_key : String,
    )
    end
  end
end
