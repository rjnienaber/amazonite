module Amazonite::SsmV1
  class AutomationExecutionPreview
    include JSON::Serializable

    @[JSON::Field(key: "StepPreviews")]
    property step_previews : Hash(ImpactType, Int32) | Nil

    @[JSON::Field(key: "Regions")]
    property regions : Array(String) | Nil

    @[JSON::Field(key: "TargetPreviews")]
    property target_previews : Array(TargetPreview) | Nil

    @[JSON::Field(key: "TotalAccounts")]
    property total_accounts : Int32 | Nil

    def initialize(
      @step_previews : Hash(ImpactType, Int32) | Nil = nil,
      @regions : Array(String) | Nil = nil,
      @target_previews : Array(TargetPreview) | Nil = nil,
      @total_accounts : Int32 | Nil = nil,
    )
    end
  end
end
