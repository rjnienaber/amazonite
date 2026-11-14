module Amazonite::Ssm
  # The number of targets in a rate control execution, and the status of the child executions that
  # it started for those targets.
  class TargetsSummary
    include JSON::Serializable

    # The total number of targets in the rate control execution.
    @[JSON::Field(key: "TotalCount")]
    property total_count : Int32 | Nil

    # The number of child executions that started.
    @[JSON::Field(key: "StartedCount")]
    property started_count : Int32 | Nil

    # The number of child executions that finished, whether they succeeded or failed.
    @[JSON::Field(key: "CompletedCount")]
    property completed_count : Int32 | Nil

    # The number of child executions that succeeded.
    @[JSON::Field(key: "SuccessfulCount")]
    property successful_count : Int32 | Nil

    # The number of child executions that failed, timed out, or were canceled.
    @[JSON::Field(key: "FailedCount")]
    property failed_count : Int32 | Nil

    def initialize(
      @total_count : Int32 | Nil = nil,
      @started_count : Int32 | Nil = nil,
      @completed_count : Int32 | Nil = nil,
      @successful_count : Int32 | Nil = nil,
      @failed_count : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@total_count, @started_count, @completed_count, @successful_count, @failed_count)
  end
end
