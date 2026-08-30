module Amazonite::CloudWatchV1
  class PutManagedInsightRulesOutput
    include JSON::Serializable

    # An array that lists the rules that could not be enabled.
    @[JSON::Field(key: "Failures")]
    property failures : Array(PartialFailure) | Nil

    def initialize(
      @failures : Array(PartialFailure) | Nil = nil,
    )
    end

    def_equals_and_hash(@failures)
  end
end
