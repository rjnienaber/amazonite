module Amazonite::ApiGatewayV1
  # Gets the VpcLinks collection under the caller's account in a selected region.
  class GetVpcLinksRequest
    include JSON::Serializable

    # The current pagination position in the paged result set.
    @[JSON::Field(key: "position", ignore: true)]
    property position : String | Nil

    # The maximum number of returned results per page. The default value is 25 and the maximum value
    # is 500.
    @[JSON::Field(key: "limit", ignore: true)]
    property limit : Int32 | Nil

    def initialize(
      @position : String | Nil = nil,
      @limit : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@position, @limit)
  end
end
