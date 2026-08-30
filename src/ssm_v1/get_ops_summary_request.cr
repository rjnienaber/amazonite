private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class GetOpsSummaryRequest
    include JSON::Serializable

    # Specify the name of a resource data sync to get.
    @[JSON::Field(key: "SyncName")]
    property sync_name : String | Nil

    # Optional filters used to scope down the returned OpsData.
    @[JSON::Field(key: "Filters")]
    property filters : Array(OpsFilter) | Nil

    # Optional aggregators that return counts of OpsData based on one or more expressions.
    @[JSON::Field(key: "Aggregators")]
    property aggregators : Array(OpsAggregator) | Nil

    # The OpsData data type to return.
    @[JSON::Field(key: "ResultAttributes")]
    property result_attributes : Array(OpsResultAttribute) | Nil

    # A token to start the list. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @sync_name : String | Nil = nil,
      @filters : Array(OpsFilter) | Nil = nil,
      @aggregators : Array(OpsAggregator) | Nil = nil,
      @result_attributes : Array(OpsResultAttribute) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @sync_name
        raise Core::ValidationError.new("SyncName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SyncName length must be <= 64") if value.size > 64
      end

      if value = @filters
        raise Core::ValidationError.new("Filters must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Filters must have at most 5 item(s)") if value.size > 5
        value.each(&.validate!)
      end

      if value = @aggregators
        raise Core::ValidationError.new("Aggregators must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Aggregators must have at most 12 item(s)") if value.size > 12
        value.each(&.validate!)
      end

      if value = @result_attributes
        raise Core::ValidationError.new("ResultAttributes must have at least 1 item(s)") if value.size < 1
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 50") if value > 50
      end
    end

    def_equals_and_hash(@sync_name, @filters, @aggregators, @result_attributes, @next_token, @max_results)
  end
end
