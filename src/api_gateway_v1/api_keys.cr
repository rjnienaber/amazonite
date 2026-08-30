module Amazonite::ApiGatewayV1
  # Represents a collection of API keys as represented by an ApiKeys resource.
  class ApiKeys
    include JSON::Serializable

    # A list of warning messages logged during the import of API keys when the `failOnWarnings` option
    # is set to true.
    @[JSON::Field(key: "warnings")]
    property warnings : Array(String) | Nil

    # The current page of elements from this collection.
    @[JSON::Field(key: "item")]
    property items : Array(ApiKey) | Nil

    # The current pagination position in the paged result set.
    @[JSON::Field(key: "position", ignore: true)]
    property position : String | Nil

    def initialize(
      @warnings : Array(String) | Nil = nil,
      @items : Array(ApiKey) | Nil = nil,
      @position : String | Nil = nil,
    )
    end

    def_equals_and_hash(@warnings, @items, @position)
  end
end
