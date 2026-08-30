private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # A filter to limit the amount of step execution information returned by the call.
  class StepExecutionFilter
    include JSON::Serializable

    # One or more keys to limit the results.
    @[JSON::Field(key: "Key", converter: AS::StepExecutionFilterKey)]
    property key : StepExecutionFilterKey

    # The values of the filter key.
    @[JSON::Field(key: "Values")]
    property values : Array(String) = [] of String

    def initialize(
      @key : StepExecutionFilterKey,
      @values : Array(String),
    )
    end

    def validate! : Nil
      if value = @values
        raise Core::ValidationError.new("Values must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Values must have at most 10 item(s)") if value.size > 10
      end
    end

    def_equals_and_hash(@key, @values)
  end
end
