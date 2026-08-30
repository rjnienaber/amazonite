private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  # A filter used to match specific automation executions. This is used to limit the scope of
  # Automation execution information returned.
  class AutomationExecutionFilter
    include JSON::Serializable

    # One or more keys to limit the results.
    @[JSON::Field(key: "Key", converter: AS::AutomationExecutionFilterKey)]
    property key : AutomationExecutionFilterKey

    # The values used to limit the execution information associated with the filter's key.
    @[JSON::Field(key: "Values")]
    property values : Array(String) = [] of String

    def initialize(
      @key : AutomationExecutionFilterKey,
      @values : Array(String),
    )
    end

    def_equals_and_hash(@key, @values)
  end
end
