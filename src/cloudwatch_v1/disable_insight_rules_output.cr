module Amazonite::CloudWatchV1
  class DisableInsightRulesOutput
    include JSON::Serializable

    @[JSON::Field(key: "Failures")]
    property failures : Array(PartialFailure) | Nil

    def initialize(
      @failures : Array(PartialFailure) | Nil = nil,
    )
    end
  end
end
