module Amazonite::LambdaV1
  class GetFunctionRecursionConfigRequest
    include JSON::Serializable

    # The name of the function.
    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    def initialize(
      @function_name : String,
    )
    end

    def_equals_and_hash(@function_name)
  end
end
