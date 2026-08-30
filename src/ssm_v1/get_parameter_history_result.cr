module Amazonite::SsmV1
  class GetParameterHistoryResult
    include JSON::Serializable

    # A list of parameters returned by the request.
    @[JSON::Field(key: "Parameters")]
    property parameters : Array(ParameterHistory) | Nil

    # The token to use when requesting the next set of items. If there are no additional items to
    # return, the string is empty.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @parameters : Array(ParameterHistory) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@parameters, @next_token)
  end
end
