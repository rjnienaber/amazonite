private alias Core = Amazonite::Core

module Amazonite::CloudWatch
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

    def validate! : Nil
      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 500") if value > 500
      end
    end

    def_equals_and_hash(@next_token, @max_results)
  end
end
