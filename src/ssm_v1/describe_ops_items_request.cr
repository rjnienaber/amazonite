module Amazonite::SsmV1
  class DescribeOpsItemsRequest
    include JSON::Serializable

    # One or more filters to limit the response.
    #
    # - Key: CreatedTime
    #
    # Operations: GreaterThan, LessThan
    #
    # - Key: LastModifiedBy
    #
    # Operations: Contains, Equals
    #
    # - Key: LastModifiedTime
    #
    # Operations: GreaterThan, LessThan
    #
    # - Key: Priority
    #
    # Operations: Equals
    #
    # - Key: Source
    #
    # Operations: Contains, Equals
    #
    # - Key: Status
    #
    # Operations: Equals
    #
    # - Key: Title*
    #
    # Operations: Equals,Contains
    #
    # - Key: OperationalData**
    #
    # Operations: Equals
    #
    # - Key: OperationalDataKey
    #
    # Operations: Equals
    #
    # - Key: OperationalDataValue
    #
    # Operations: Equals, Contains
    #
    # - Key: OpsItemId
    #
    # Operations: Equals
    #
    # - Key: ResourceId
    #
    # Operations: Contains
    #
    # - Key: AutomationId
    #
    # Operations: Equals
    #
    # - Key: AccountId
    #
    # Operations: Equals
    #
    # *The Equals operator for Title matches the first 100 characters. If you specify more than 100
    # characters, they system returns an error that the filter value exceeds the length limit.
    #
    # **If you filter the response by using the OperationalData operator, specify a key-value pair by
    # using the following JSON format: {"key":"key_name","value":"a_value"}
    @[JSON::Field(key: "OpsItemFilters")]
    property ops_item_filters : Array(OpsItemFilter) | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # A token to start the list. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @ops_item_filters : Array(OpsItemFilter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
