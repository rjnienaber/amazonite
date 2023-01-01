module Amazonite::SsmV1
  class DescribeParametersRequest
    include JSON::Serializable

    @[JSON::Field(key: "Filters")]
    property filters : Array(ParametersFilter) | Nil

    @[JSON::Field(key: "ParameterFilters")]
    property parameter_filters : Array(ParameterStringFilter) | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @filters : Array(ParametersFilter) | Nil = nil,
      @parameter_filters : Array(ParameterStringFilter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
