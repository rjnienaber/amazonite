private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  # Describes a filter for a specific list of OpsItem events. You can filter event information by
  # using tags. You specify tags by using a key-value pair mapping.
  class OpsItemEventFilter
    include JSON::Serializable

    # The name of the filter key. Currently, the only supported value is `OpsItemId`.
    @[JSON::Field(key: "Key", converter: AS::OpsItemEventFilterKey)]
    property key : OpsItemEventFilterKey

    # The values for the filter, consisting of one or more OpsItem IDs.
    @[JSON::Field(key: "Values")]
    property values : Array(String) = [] of String

    # The operator used by the filter call. Currently, the only supported value is `Equal`.
    @[JSON::Field(key: "Operator", converter: AS::OpsItemEventFilterOperator)]
    property operator : OpsItemEventFilterOperator

    def initialize(
      @key : OpsItemEventFilterKey,
      @values : Array(String),
      @operator : OpsItemEventFilterOperator,
    )
    end
  end
end
