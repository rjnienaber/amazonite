private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  # Describes a filter for a specific list of related-item resources.
  class OpsItemRelatedItemsFilter
    include JSON::Serializable

    # The name of the filter key. Supported values include `ResourceUri`, `ResourceType`, or
    # `AssociationId`.
    @[JSON::Field(key: "Key", converter: AS::OpsItemRelatedItemsFilterKey)]
    property key : OpsItemRelatedItemsFilterKey

    # The values for the filter.
    @[JSON::Field(key: "Values")]
    property values : Array(String) = [] of String

    # The operator used by the filter call. The only supported operator is `EQUAL`.
    @[JSON::Field(key: "Operator", converter: AS::OpsItemRelatedItemsFilterOperator)]
    property operator : OpsItemRelatedItemsFilterOperator

    def initialize(
      @key : OpsItemRelatedItemsFilterKey,
      @values : Array(String),
      @operator : OpsItemRelatedItemsFilterOperator,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@key, @values, @operator)
  end
end
