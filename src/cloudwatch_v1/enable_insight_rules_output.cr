module Amazonite::CloudWatchV1
  class EnableInsightRulesOutput
    include JSON::Serializable

    # An array listing the rules that could not be enabled. You cannot disable or enable built-in
    # rules.
    @[JSON::Field(key: "Failures")]
    property failures : Array(PartialFailure) | Nil

    def initialize(
      @failures : Array(PartialFailure) | Nil = nil,
    )
    end

    def_equals_and_hash(@failures)
  end
end
