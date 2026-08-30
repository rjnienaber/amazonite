module Amazonite::ApiGatewayV1
  # A request to get information about the current ApiKeys resource.
  class GetApiKeysRequest
    include JSON::Serializable

    # The current pagination position in the paged result set.
    @[JSON::Field(key: "position", ignore: true)]
    property position : String | Nil

    # The maximum number of returned results per page. The default value is 25 and the maximum value
    # is 500.
    @[JSON::Field(key: "limit", ignore: true)]
    property limit : Int32 | Nil

    # The name of queried API keys.
    @[JSON::Field(key: "nameQuery", ignore: true)]
    property name_query : String | Nil

    # The identifier of a customer in Amazon Web Services Marketplace or an external system, such as a
    # developer portal.
    @[JSON::Field(key: "customerId", ignore: true)]
    property customer_id : String | Nil

    # A boolean flag to specify whether (`true`) or not (`false`) the result contains key values.
    @[JSON::Field(key: "includeValues", ignore: true)]
    property include_values : Bool | Nil

    def initialize(
      @position : String | Nil = nil,
      @limit : Int32 | Nil = nil,
      @name_query : String | Nil = nil,
      @customer_id : String | Nil = nil,
      @include_values : Bool | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@position, @limit, @name_query, @customer_id, @include_values)
  end
end
