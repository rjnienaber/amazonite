module Amazonite::LambdaV1
  class ListFunctionEventInvokeConfigsResponse
    include JSON::Serializable

    # A list of configurations.
    @[JSON::Field(key: "FunctionEventInvokeConfigs")]
    property function_event_invoke_configs : Array(FunctionEventInvokeConfig) | Nil

    # The pagination token that's included if more results are available.
    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    def initialize(
      @function_event_invoke_configs : Array(FunctionEventInvokeConfig) | Nil = nil,
      @next_marker : String | Nil = nil,
    )
    end
  end
end
