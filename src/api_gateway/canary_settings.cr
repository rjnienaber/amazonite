module Amazonite::ApiGateway
  # Configuration settings of a canary deployment.
  class CanarySettings
    include JSON::Serializable

    # The percent (0-100) of traffic diverted to a canary deployment.
    @[JSON::Field(key: "percentTraffic")]
    property percent_traffic : Float64 | Nil

    # The ID of the canary deployment.
    @[JSON::Field(key: "deploymentId")]
    property deployment_id : String | Nil

    # Stage variables overridden for a canary release deployment, including new stage variables
    # introduced in the canary. These stage variables are represented as a string-to-string map
    # between stage variable names and their values.
    @[JSON::Field(key: "stageVariableOverrides")]
    property stage_variable_overrides : Hash(String, String) | Nil

    # A Boolean flag to indicate whether the canary deployment uses the stage cache or not.
    @[JSON::Field(key: "useStageCache")]
    property use_stage_cache : Bool | Nil

    def initialize(
      @percent_traffic : Float64 | Nil = nil,
      @deployment_id : String | Nil = nil,
      @stage_variable_overrides : Hash(String, String) | Nil = nil,
      @use_stage_cache : Bool | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@percent_traffic, @deployment_id, @stage_variable_overrides, @use_stage_cache)
  end
end
