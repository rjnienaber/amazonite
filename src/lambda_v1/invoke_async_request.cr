module Amazonite::LambdaV1
  class InvokeAsyncRequest
    include JSON::Serializable

    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    @[JSON::Field(key: "InvokeArgs")]
    property invoke_args : String

    def initialize(
      @function_name : String,
      @invoke_args : String,
    )
    end
  end
end
