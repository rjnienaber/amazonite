module Amazonite::SsmV1
  class DescribeInstanceInformationRequest
    include JSON::Serializable

    # This is a legacy method. We recommend that you don't use this method. Instead, use the `Filters`
    # data type. `Filters` enables you to return node information by filtering based on tags applied
    # to managed nodes.
    #
    # Attempting to use `InstanceInformationFilterList` and `Filters` leads to an exception error.
    @[JSON::Field(key: "InstanceInformationFilterList")]
    property instance_information_filter_list : Array(InstanceInformationFilter) | Nil

    # One or more filters. Use a filter to return a more specific list of managed nodes. You can
    # filter based on tags applied to your managed nodes. Tag filters can't be combined with other
    # filter types. Use this `Filters` data type instead of `InstanceInformationFilterList`, which is
    # deprecated.
    @[JSON::Field(key: "Filters")]
    property filters : Array(InstanceInformationStringFilter) | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results. The default value is 10 items.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @instance_information_filter_list : Array(InstanceInformationFilter) | Nil = nil,
      @filters : Array(InstanceInformationStringFilter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
