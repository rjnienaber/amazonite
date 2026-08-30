module Amazonite::CloudWatchLogsV1
  class DescribeIndexPoliciesResponse
    include JSON::Serializable

    # An array containing the field index policies.
    @[JSON::Field(key: "indexPolicies")]
    property index_policies : Array(IndexPolicy) | Nil

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @index_policies : Array(IndexPolicy) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
