module Amazonite::LambdaV1
  class ListFunctionUrlConfigsResponse
    include JSON::Serializable

    @[JSON::Field(key: "FunctionUrlConfigs")]
    property function_url_configs : Array(FunctionUrlConfig) = [] of FunctionUrlConfig

    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    def initialize(
      @function_url_configs : Array(FunctionUrlConfig),
      @next_marker : String | Nil = nil,
    )
    end
  end
end
