module Amazonite::SsmV1
  class GetParametersByPathResult
    include JSON::Serializable

    @[JSON::Field(key: "Parameters")]
    property parameters : Array(Parameter) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @parameters : Array(Parameter) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
