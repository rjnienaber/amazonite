private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @min_execution_environments
        raise Core::ValidationError.new("MinExecutionEnvironments value must be >= 0") if value < 0
        raise Core::ValidationError.new("MinExecutionEnvironments value must be <= 15000") if value > 15000
      end

      if value = @max_execution_environments
        raise Core::ValidationError.new("MaxExecutionEnvironments value must be >= 0") if value < 0
        raise Core::ValidationError.new("MaxExecutionEnvironments value must be <= 15000") if value > 15000
      end
    end

    def_equals_and_hash(@min_execution_environments, @max_execution_environments)
  end
end
