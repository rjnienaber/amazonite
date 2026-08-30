private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  class ListEndpointsRequest
    include JSON::Serializable

    # A value that will return a subset of the endpoints associated with this account. For example,
    # `"NamePrefix": "ABC"` will return all endpoints with "ABC" in the name.
    @[JSON::Field(key: "NamePrefix")]
    property name_prefix : String | Nil

    # The primary Region of the endpoints associated with this account. For example `"HomeRegion":
    # "us-east-1"`.
    @[JSON::Field(key: "HomeRegion")]
    property home_region : String | Nil

    # The token returned by a previous call, which you can use to retrieve the next set of results.
    #
    # The value of `nextToken` is a unique pagination token for each page. To retrieve the next page
    # of results, make the call again using the returned token. Keep all other arguments unchanged.
    #
    # Using an expired pagination token results in an `HTTP 400 InvalidToken` error.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # The maximum number of results returned by the call.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @name_prefix : String | Nil = nil,
      @home_region : String | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @name_prefix
        raise Core::ValidationError.new("NamePrefix length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NamePrefix length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("NamePrefix does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_A-Za-z0-9]+$"))
      end

      if value = @home_region
        raise Core::ValidationError.new("HomeRegion length must be >= 9") if value.size < 9
        raise Core::ValidationError.new("HomeRegion length must be <= 20") if value.size > 20
        raise Core::ValidationError.new("HomeRegion does not match the required pattern") unless value.matches?(Regex.new("^[\\-a-z0-9]+$"))
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 2048") if value.size > 2048
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 100") if value > 100
      end
    end

    def_equals_and_hash(@name_prefix, @home_region, @next_token, @max_results)
  end
end
