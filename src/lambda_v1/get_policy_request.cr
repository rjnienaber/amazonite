module Amazonite::LambdaV1
  class GetPolicyRequest
    include JSON::Serializable

    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    @[JSON::Field(key: "Qualifier", ignore: true)]
    property qualifier : String | Nil

    def initialize(
      @function_name : String,
      @qualifier : String | Nil = nil,
    )
    end
  end
end
