private alias Core = Amazonite::Core

module Amazonite::Ssm
  class DescribeInstancePropertiesRequest
    include JSON::Serializable

    # An array of instance property filters.
    @[JSON::Field(key: "InstancePropertyFilterList")]
    property instance_property_filter_list : Array(InstancePropertyFilter) | Nil

    # The request filters to use with the operator.
    @[JSON::Field(key: "FiltersWithOperator")]
    property filters_with_operator : Array(InstancePropertyStringFilter) | Nil

    # The maximum number of items to return for the call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # The token provided by a previous request to use to return the next set of properties.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @instance_property_filter_list : Array(InstancePropertyFilter) | Nil = nil,
      @filters_with_operator : Array(InstancePropertyStringFilter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @instance_property_filter_list
        raise Core::ValidationError.new("InstancePropertyFilterList must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("InstancePropertyFilterList must have at most 40 item(s)") if value.size > 40
        value.each(&.validate!)
      end

      if value = @filters_with_operator
        raise Core::ValidationError.new("FiltersWithOperator must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("FiltersWithOperator must have at most 40 item(s)") if value.size > 40
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 5") if value < 5
        raise Core::ValidationError.new("MaxResults value must be <= 1000") if value > 1000
      end
    end

    def_equals_and_hash(@instance_property_filter_list, @filters_with_operator, @max_results, @next_token)
  end
end
