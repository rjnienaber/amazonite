private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class DeleteInsightRulesOutput
    include JSON::Serializable

    # An array listing the rules that could not be deleted. You cannot delete built-in rules.
    @[JSON::Field(key: "Failures")]
    property failures : Array(PartialFailure) | Nil

    def initialize(
      @failures : Array(PartialFailure) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @failures
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@failures)
  end
end
