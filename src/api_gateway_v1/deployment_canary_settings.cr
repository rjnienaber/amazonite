module Amazonite::ApiGatewayV1
  # The input configuration for a canary deployment.
  class DeploymentCanarySettings
    include JSON::Serializable

    # The percentage (0.0-100.0) of traffic routed to the canary deployment.
    @[JSON::Field(key: "percentTraffic")]
    property percent_traffic : Float64 | Nil

    # A stage variable overrides used for the canary release deployment. They can override existing
    # stage variables or add new stage variables for the canary release deployment. These stage
    # variables are represented as a string-to-string map between stage variable names and their
    # values.
    @[JSON::Field(key: "stageVariableOverrides")]
    property stage_variable_overrides : Hash(String, String) | Nil

    # A Boolean flag to indicate whether the canary release deployment uses the stage cache or not.
    @[JSON::Field(key: "useStageCache")]
    property use_stage_cache : Bool | Nil

    def initialize(
      @percent_traffic : Float64 | Nil = nil,
      @stage_variable_overrides : Hash(String, String) | Nil = nil,
      @use_stage_cache : Bool | Nil = nil,
    )
    end

    def_equals_and_hash(@percent_traffic, @stage_variable_overrides, @use_stage_cache)
  end
end
