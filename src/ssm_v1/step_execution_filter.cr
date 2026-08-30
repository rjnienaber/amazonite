private alias AS = Amazonite::SsmV1

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

    def_equals_and_hash(@key, @values)
  end
end
