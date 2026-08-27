module Amazonite::SsmV1
  class DescribeInstancePropertiesRequest
    include JSON::Serializable

    @[JSON::Field(key: "InstancePropertyFilterList")]
    property instance_property_filter_list : Array(InstancePropertyFilter) | Nil

    @[JSON::Field(key: "FiltersWithOperator")]
    property filters_with_operator : Array(InstancePropertyStringFilter) | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @instance_property_filter_list : Array(InstancePropertyFilter) | Nil = nil,
      @filters_with_operator : Array(InstancePropertyStringFilter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
