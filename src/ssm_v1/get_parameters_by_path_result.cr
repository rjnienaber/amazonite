module Amazonite::SsmV1
  class GetParametersByPathResult
    include JSON::Serializable

    # A list of parameters found in the specified hierarchy.
    @[JSON::Field(key: "Parameters")]
    property parameters : Array(Parameter) | Nil

    # The token for the next set of items to return. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @parameters : Array(Parameter) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@parameters, @next_token)
  end
end
