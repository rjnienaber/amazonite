module Amazonite::LambdaV1
  class GetFunctionCodeSigningConfigRequest
    include JSON::Serializable

    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    def initialize(
      @function_name : String,
    )
    end
  end
end
