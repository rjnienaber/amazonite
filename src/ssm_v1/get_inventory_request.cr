private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class GetInventoryRequest
    include JSON::Serializable

    # One or more filters. Use a filter to return a more specific list of results.
    @[JSON::Field(key: "Filters")]
    property filters : Array(InventoryFilter) | Nil

    # Returns counts of inventory types based on one or more expressions. For example, if you
    # aggregate by using an expression that uses the `AWS:InstanceInformation.PlatformType` type, you
    # can see a count of how many Windows and Linux managed nodes exist in your inventoried fleet.
    @[JSON::Field(key: "Aggregators")]
    property aggregators : Array(InventoryAggregator) | Nil

    # The list of inventory item types to return.
    @[JSON::Field(key: "ResultAttributes")]
    property result_attributes : Array(ResultAttribute) | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @filters : Array(InventoryFilter) | Nil = nil,
      @aggregators : Array(InventoryAggregator) | Nil = nil,
      @result_attributes : Array(ResultAttribute) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @filters
        raise Core::ValidationError.new("Filters must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Filters must have at most 5 item(s)") if value.size > 5
        value.each(&.validate!)
      end

      if value = @aggregators
        raise Core::ValidationError.new("Aggregators must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Aggregators must have at most 10 item(s)") if value.size > 10
        value.each(&.validate!)
      end

      if value = @result_attributes
        raise Core::ValidationError.new("ResultAttributes must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("ResultAttributes must have at most 1 item(s)") if value.size > 1
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 50") if value > 50
      end
    end

    def_equals_and_hash(@filters, @aggregators, @result_attributes, @next_token, @max_results)
  end
end
