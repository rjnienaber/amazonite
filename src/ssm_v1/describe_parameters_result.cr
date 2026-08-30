private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class DescribeParametersResult
    include JSON::Serializable

    # Parameters returned by the request.
    @[JSON::Field(key: "Parameters")]
    property parameters : Array(ParameterMetadata) | Nil

    # The token to use when requesting the next set of items.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @parameters : Array(ParameterMetadata) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @parameters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@parameters, @next_token)
  end
end
