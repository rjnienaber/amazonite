module Amazonite::CloudWatchV1
  class ListManagedInsightRulesInput
    include JSON::Serializable

    # The ARN of an Amazon Web Services resource that has managed Contributor Insights rules.
    @[JSON::Field(key: "ResourceARN")]
    property resource_arn : String

    # Include this value to get the next set of rules if the value was returned by the previous
    # operation.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # The maximum number of results to return in one operation. If you omit this parameter, the
    # default number is used. The default number is `100`.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @resource_arn : String,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def_equals_and_hash(@resource_arn, @next_token, @max_results)
  end
end
