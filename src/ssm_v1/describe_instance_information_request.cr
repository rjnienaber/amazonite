module Amazonite::SsmV1
  class DescribeInstanceInformationRequest
    include JSON::Serializable

    @[JSON::Field(key: "InstanceInformationFilterList")]
    property instance_information_filter_list : Array(InstanceInformationFilter) | Nil

    @[JSON::Field(key: "Filters")]
    property filters : Array(InstanceInformationStringFilter) | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @instance_information_filter_list : Array(InstanceInformationFilter) | Nil = nil,
      @filters : Array(InstanceInformationStringFilter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
