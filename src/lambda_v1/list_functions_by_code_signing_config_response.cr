module Amazonite::LambdaV1
  class ListFunctionsByCodeSigningConfigResponse
    include JSON::Serializable

    # The pagination token that's included if more results are available.
    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    # The function ARNs.
    @[JSON::Field(key: "FunctionArns")]
    property function_arns : Array(String) | Nil

    def initialize(
      @next_marker : String | Nil = nil,
      @function_arns : Array(String) | Nil = nil,
    )
    end

    def_equals_and_hash(@next_marker, @function_arns)
  end
end
