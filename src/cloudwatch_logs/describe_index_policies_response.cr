private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
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

    def validate! : Nil
      if value = @index_policies
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@index_policies, @next_token)
  end
end
