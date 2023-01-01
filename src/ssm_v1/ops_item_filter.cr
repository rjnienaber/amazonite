private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class OpsItemFilter
    include JSON::Serializable

    @[JSON::Field(key: "Key", converter: AS::OpsItemFilterKey)]
    property key : OpsItemFilterKey

    @[JSON::Field(key: "Values")]
    property values : Array(String)

    @[JSON::Field(key: "Operator", converter: AS::OpsItemFilterOperator)]
    property operator : OpsItemFilterOperator

    def initialize(
      @key : OpsItemFilterKey,
      @values : Array(String),
      @operator : OpsItemFilterOperator
    )
    end
  end
end
