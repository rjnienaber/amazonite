module Amazonite::SsmV1
  class ProgressCounters
    include JSON::Serializable

    @[JSON::Field(key: "TotalSteps")]
    property total_steps : Int32 | Nil

    @[JSON::Field(key: "SuccessSteps")]
    property success_steps : Int32 | Nil

    @[JSON::Field(key: "FailedSteps")]
    property failed_steps : Int32 | Nil

    @[JSON::Field(key: "CancelledSteps")]
    property cancelled_steps : Int32 | Nil

    @[JSON::Field(key: "TimedOutSteps")]
    property timed_out_steps : Int32 | Nil

    def initialize(
      @total_steps : Int32 | Nil = nil,
      @success_steps : Int32 | Nil = nil,
      @failed_steps : Int32 | Nil = nil,
      @cancelled_steps : Int32 | Nil = nil,
      @timed_out_steps : Int32 | Nil = nil
    )
    end
  end
end
