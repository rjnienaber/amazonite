module Amazonite::LambdaV1
  class ListVersionsByFunctionResponse
    include JSON::Serializable

    # The pagination token that's included if more results are available.
    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    # A list of Lambda function versions.
    @[JSON::Field(key: "Versions")]
    property versions : Array(FunctionConfiguration) | Nil

    def initialize(
      @next_marker : String | Nil = nil,
      @versions : Array(FunctionConfiguration) | Nil = nil,
    )
    end

    def_equals_and_hash(@next_marker, @versions)
  end
end
