module Amazonite::SsmV1
  class DescribeParametersResult
    include JSON::Serializable

    @[JSON::Field(key: "Parameters")]
    property parameters : Array(ParameterMetadata) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @parameters : Array(ParameterMetadata) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
