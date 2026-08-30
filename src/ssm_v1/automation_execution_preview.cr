private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Information about the results of the execution preview.
  class AutomationExecutionPreview
    include JSON::Serializable

    # Information about the type of impact a runbook step would have on a resource.
    #
    # - `Mutating`: The runbook step would make changes to the targets through actions that create,
    # modify, or delete resources.
    #
    # - `Non_Mutating`: The runbook step would retrieve data about resources but not make changes to
    # them. This category generally includes `Describe*`, `List*`, `Get*`, and similar read-only API
    # actions.
    #
    # - `Undetermined`: An undetermined step invokes executions performed by another orchestration
    # service like Lambda, Step Functions, or Amazon Web Services Systems Manager Run Command. An
    # undetermined step might also call a third-party API. Systems Manager Automation doesn't know the
    # outcome of the orchestration processes or third-party API executions, so the results of the
    # steps are undetermined.
    @[JSON::Field(key: "StepPreviews")]
    property step_previews : Hash(ImpactType, Int32) | Nil

    # Information about the Amazon Web Services Regions targeted by the execution preview.
    @[JSON::Field(key: "Regions")]
    property regions : Array(String) | Nil

    # Information that provides a preview of what the impact of running the specified Automation
    # runbook would be.
    @[JSON::Field(key: "TargetPreviews")]
    property target_previews : Array(TargetPreview) | Nil

    # Information about the Amazon Web Services accounts that were included in the execution preview.
    @[JSON::Field(key: "TotalAccounts")]
    property total_accounts : Int32 | Nil

    def initialize(
      @step_previews : Hash(ImpactType, Int32) | Nil = nil,
      @regions : Array(String) | Nil = nil,
      @target_previews : Array(TargetPreview) | Nil = nil,
      @total_accounts : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @regions
        raise Core::ValidationError.new("Regions must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Regions must have at most 50 item(s)") if value.size > 50
      end

      if value = @target_previews
        raise Core::ValidationError.new("TargetPreviews must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("TargetPreviews must have at most 50 item(s)") if value.size > 50
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@step_previews, @regions, @target_previews, @total_accounts)
  end
end
