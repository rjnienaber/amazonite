module Amazonite::ApiGateway
  # Gets the GatewayResponses collection on the given RestApi. If an API developer has not added any
  # definitions for gateway responses, the result will be the API Gateway-generated default
  # GatewayResponses collection for the supported response types.
  class GetGatewayResponsesRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The current pagination position in the paged result set. The GatewayResponse collection does not
    # support pagination and the position does not apply here.
    @[JSON::Field(key: "position", ignore: true)]
    property position : String | Nil

    # The maximum number of returned results per page. The default value is 25 and the maximum value
    # is 500. The GatewayResponses collection does not support pagination and the limit does not apply
    # here.
    @[JSON::Field(key: "limit", ignore: true)]
    property limit : Int32 | Nil

    def initialize(
      @rest_api_id : String,
      @position : String | Nil = nil,
      @limit : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@rest_api_id, @position, @limit)
  end
end
