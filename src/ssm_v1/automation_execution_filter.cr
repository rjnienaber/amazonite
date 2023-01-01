private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class AutomationExecutionFilter
    include JSON::Serializable

    @[JSON::Field(key: "Key", converter: AS::AutomationExecutionFilterKey)]
    property key : AutomationExecutionFilterKey

    @[JSON::Field(key: "Values")]
    property values : Array(String)

    def initialize(
      @key : AutomationExecutionFilterKey,
      @values : Array(String)
    )
    end
  end
end
