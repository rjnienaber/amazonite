private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class PutFunctionRecursionConfigRequest
    include JSON::Serializable

    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    @[JSON::Field(key: "RecursiveLoop", converter: AL::RecursiveLoop)]
    property recursive_loop : RecursiveLoop

    def initialize(
      @function_name : String,
      @recursive_loop : RecursiveLoop,
    )
    end
  end
end
