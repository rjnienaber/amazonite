module Amazonite::SsmV1
  # An aggregate of step execution statuses displayed in the Amazon Web Services Systems Manager
  # console for a multi-Region and multi-account Automation execution.
  class ProgressCounters
    include JSON::Serializable

    # The total number of steps run in all specified Amazon Web Services Regions and Amazon Web
    # Services accounts for the current Automation execution.
    @[JSON::Field(key: "TotalSteps")]
    property total_steps : Int32 | Nil

    # The total number of steps that successfully completed in all specified Amazon Web Services
    # Regions and Amazon Web Services accounts for the current Automation execution.
    @[JSON::Field(key: "SuccessSteps")]
    property success_steps : Int32 | Nil

    # The total number of steps that failed to run in all specified Amazon Web Services Regions and
    # Amazon Web Services accounts for the current Automation execution.
    @[JSON::Field(key: "FailedSteps")]
    property failed_steps : Int32 | Nil

    # The total number of steps that the system cancelled in all specified Amazon Web Services Regions
    # and Amazon Web Services accounts for the current Automation execution.
    @[JSON::Field(key: "CancelledSteps")]
    property cancelled_steps : Int32 | Nil

    # The total number of steps that timed out in all specified Amazon Web Services Regions and Amazon
    # Web Services accounts for the current Automation execution.
    @[JSON::Field(key: "TimedOutSteps")]
    property timed_out_steps : Int32 | Nil

    def initialize(
      @total_steps : Int32 | Nil = nil,
      @success_steps : Int32 | Nil = nil,
      @failed_steps : Int32 | Nil = nil,
      @cancelled_steps : Int32 | Nil = nil,
      @timed_out_steps : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@total_steps, @success_steps, @failed_steps, @cancelled_steps, @timed_out_steps)
  end
end
