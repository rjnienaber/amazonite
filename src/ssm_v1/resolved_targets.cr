module Amazonite::SsmV1
  # Information about targets that resolved during the Automation execution.
  class ResolvedTargets
    include JSON::Serializable

    # A list of parameter values sent to targets that resolved during the Automation execution.
    @[JSON::Field(key: "ParameterValues")]
    property parameter_values : Array(String) | Nil

    # A boolean value indicating whether the resolved target list is truncated.
    @[JSON::Field(key: "Truncated")]
    property truncated : Bool | Nil

    def initialize(
      @parameter_values : Array(String) | Nil = nil,
      @truncated : Bool | Nil = nil,
    )
    end

    def_equals_and_hash(@parameter_values, @truncated)
  end
end
