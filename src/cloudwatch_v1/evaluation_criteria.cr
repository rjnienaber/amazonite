module Amazonite::CloudWatchV1
  # The evaluation criteria for an alarm. This is a union type that currently supports
  # `PromQLCriteria`.
  class EvaluationCriteria
    include JSON::Serializable

    # The PromQL criteria for the alarm evaluation.
    @[JSON::Field(key: "PromQLCriteria")]
    property prom_ql_criteria : AlarmPromQLCriteria | Nil

    def initialize(
      @prom_ql_criteria : AlarmPromQLCriteria | Nil = nil,
    )
    end

    def_equals_and_hash(@prom_ql_criteria)
  end
end
