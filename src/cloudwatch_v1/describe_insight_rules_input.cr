module Amazonite::CloudWatchV1
  class DescribeInsightRulesInput
    include JSON::Serializable

    # Include this value, if it was returned by the previous operation, to get the next set of rules.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # The maximum number of results to return in one operation. If you omit this parameter, the
    # default of 500 is used.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end
  end
end
