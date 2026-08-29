module Amazonite::CloudWatchV1
  class EvaluationCriteria
    include JSON::Serializable

    @[JSON::Field(key: "PromQLCriteria")]
    property prom_ql_criteria : AlarmPromQLCriteria | Nil

    def initialize(
      @prom_ql_criteria : AlarmPromQLCriteria | Nil = nil,
    )
    end
  end
end
