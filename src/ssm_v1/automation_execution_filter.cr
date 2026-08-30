private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @values
        raise Core::ValidationError.new("Values must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Values must have at most 10 item(s)") if value.size > 10
      end
    end

    def_equals_and_hash(@key, @values)
  end
end
