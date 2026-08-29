module Amazonite::LambdaV1
  class ListFunctionsByCodeSigningConfigResponse
    include JSON::Serializable

    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    @[JSON::Field(key: "FunctionArns")]
    property function_arns : Array(String) | Nil

    def initialize(
      @next_marker : String | Nil = nil,
      @function_arns : Array(String) | Nil = nil,
    )
    end
  end
end
