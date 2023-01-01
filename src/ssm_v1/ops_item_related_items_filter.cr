private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class OpsItemRelatedItemsFilter
    include JSON::Serializable

    @[JSON::Field(key: "Key", converter: AS::OpsItemRelatedItemsFilterKey)]
    property key : OpsItemRelatedItemsFilterKey

    @[JSON::Field(key: "Values")]
    property values : Array(String)

    @[JSON::Field(key: "Operator", converter: AS::OpsItemRelatedItemsFilterOperator)]
    property operator : OpsItemRelatedItemsFilterOperator

    def initialize(
      @key : OpsItemRelatedItemsFilterKey,
      @values : Array(String),
      @operator : OpsItemRelatedItemsFilterOperator
    )
    end
  end
end
