private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  # Describes an OpsItem filter.
  class OpsItemFilter
    include JSON::Serializable

    # The name of the filter.
    @[JSON::Field(key: "Key", converter: AS::OpsItemFilterKey)]
    property key : OpsItemFilterKey

    # The filter value.
    @[JSON::Field(key: "Values")]
    property values : Array(String) = [] of String

    # The operator used by the filter call.
    @[JSON::Field(key: "Operator", converter: AS::OpsItemFilterOperator)]
    property operator : OpsItemFilterOperator

    def initialize(
      @key : OpsItemFilterKey,
      @values : Array(String),
      @operator : OpsItemFilterOperator,
    )
    end

    def_equals_and_hash(@key, @values, @operator)
  end
end
