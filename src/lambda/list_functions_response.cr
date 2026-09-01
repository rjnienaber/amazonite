private alias Core = Amazonite::Core

module Amazonite::Lambda
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

    def validate! : Nil
      if value = @functions
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_marker, @functions)
  end
end
