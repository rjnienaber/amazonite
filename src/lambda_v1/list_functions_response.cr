module Amazonite::LambdaV1
  # A list of Lambda functions.
  class ListFunctionsResponse
    include JSON::Serializable

    # The pagination token that's included if more results are available.
    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    # A list of Lambda functions.
    @[JSON::Field(key: "Functions")]
    property functions : Array(FunctionConfiguration) | Nil

    def initialize(
      @next_marker : String | Nil = nil,
      @functions : Array(FunctionConfiguration) | Nil = nil,
    )
    end
  end
end
