private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class ListFunctionUrlConfigsResponse
    include JSON::Serializable

    # A list of function URL configurations.
    @[JSON::Field(key: "FunctionUrlConfigs")]
    property function_url_configs : Array(FunctionUrlConfig) = [] of FunctionUrlConfig

    # The pagination token that's included if more results are available.
    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    def initialize(
      @function_url_configs : Array(FunctionUrlConfig),
      @next_marker : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @function_url_configs
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@function_url_configs, @next_marker)
  end
end
