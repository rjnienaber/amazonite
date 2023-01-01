private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class StepExecutionFilter
    include JSON::Serializable

    @[JSON::Field(key: "Key", converter: AS::StepExecutionFilterKey)]
    property key : StepExecutionFilterKey

    @[JSON::Field(key: "Values")]
    property values : Array(String)

    def initialize(
      @key : StepExecutionFilterKey,
      @values : Array(String)
    )
    end
  end
end
