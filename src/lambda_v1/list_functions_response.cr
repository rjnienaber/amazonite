module Amazonite::LambdaV1
  class ListFunctionsResponse
    include JSON::Serializable

    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    @[JSON::Field(key: "Functions")]
    property functions : Array(FunctionConfiguration) | Nil

    def initialize(
      @next_marker : String | Nil = nil,
      @functions : Array(FunctionConfiguration) | Nil = nil,
    )
    end
  end
end
