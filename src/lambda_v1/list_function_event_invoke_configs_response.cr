module Amazonite::LambdaV1
  class ListFunctionEventInvokeConfigsResponse
    include JSON::Serializable

    @[JSON::Field(key: "FunctionEventInvokeConfigs")]
    property function_event_invoke_configs : Array(FunctionEventInvokeConfig) | Nil

    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    def initialize(
      @function_event_invoke_configs : Array(FunctionEventInvokeConfig) | Nil = nil,
      @next_marker : String | Nil = nil,
    )
    end
  end
end
