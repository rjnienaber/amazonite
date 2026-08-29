module Amazonite::LambdaV1
  class ListVersionsByFunctionResponse
    include JSON::Serializable

    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    @[JSON::Field(key: "Versions")]
    property versions : Array(FunctionConfiguration) | Nil

    def initialize(
      @next_marker : String | Nil = nil,
      @versions : Array(FunctionConfiguration) | Nil = nil,
    )
    end
  end
end
