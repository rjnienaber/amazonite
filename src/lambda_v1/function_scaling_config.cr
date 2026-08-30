module Amazonite::LambdaV1
  # Configuration that defines the scaling behavior for a Lambda Managed Instances function,
  # including the minimum and maximum number of execution environments that can be provisioned.
  class FunctionScalingConfig
    include JSON::Serializable

    # The minimum number of execution environments to maintain for the function.
    @[JSON::Field(key: "MinExecutionEnvironments")]
    property min_execution_environments : Int32 | Nil

    # The maximum number of execution environments that can be provisioned for the function.
    @[JSON::Field(key: "MaxExecutionEnvironments")]
    property max_execution_environments : Int32 | Nil

    def initialize(
      @min_execution_environments : Int32 | Nil = nil,
      @max_execution_environments : Int32 | Nil = nil,
    )
    end

    def_equals_and_hash(@min_execution_environments, @max_execution_environments)
  end
end
