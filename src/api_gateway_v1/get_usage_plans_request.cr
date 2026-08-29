module Amazonite::ApiGatewayV1
  # The GET request to get all the usage plans of the caller's account.
  class GetUsagePlansRequest
    include JSON::Serializable

    # The current pagination position in the paged result set.
    @[JSON::Field(key: "position", ignore: true)]
    property position : String | Nil

    # The identifier of the API key associated with the usage plans.
    @[JSON::Field(key: "keyId", ignore: true)]
    property key_id : String | Nil

    # The maximum number of returned results per page. The default value is 25 and the maximum value
    # is 500.
    @[JSON::Field(key: "limit", ignore: true)]
    property limit : Int32 | Nil

    def initialize(
      @position : String | Nil = nil,
      @key_id : String | Nil = nil,
      @limit : Int32 | Nil = nil,
    )
    end
  end
end
