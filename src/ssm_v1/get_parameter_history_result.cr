module Amazonite::SsmV1
  class GetParameterHistoryResult
    include JSON::Serializable

    @[JSON::Field(key: "Parameters")]
    property parameters : Array(ParameterHistory) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @parameters : Array(ParameterHistory) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
