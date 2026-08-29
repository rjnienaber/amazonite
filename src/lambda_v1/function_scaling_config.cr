module Amazonite::LambdaV1
  class FunctionScalingConfig
    include JSON::Serializable

    @[JSON::Field(key: "MinExecutionEnvironments")]
    property min_execution_environments : Int32 | Nil

    @[JSON::Field(key: "MaxExecutionEnvironments")]
    property max_execution_environments : Int32 | Nil

    def initialize(
      @min_execution_environments : Int32 | Nil = nil,
      @max_execution_environments : Int32 | Nil = nil,
    )
    end
  end
end
