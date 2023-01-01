private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class OpsItemEventFilter
    include JSON::Serializable

    @[JSON::Field(key: "Key", converter: AS::OpsItemEventFilterKey)]
    property key : OpsItemEventFilterKey

    @[JSON::Field(key: "Values")]
    property values : Array(String)

    @[JSON::Field(key: "Operator", converter: AS::OpsItemEventFilterOperator)]
    property operator : OpsItemEventFilterOperator

    def initialize(
      @key : OpsItemEventFilterKey,
      @values : Array(String),
      @operator : OpsItemEventFilterOperator
    )
    end
  end
end
