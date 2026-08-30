module Amazonite::SsmV1
  # One or more aggregators for viewing counts of OpsData using different dimensions such as
  # `Source`, `CreatedTime`, or `Source and CreatedTime`, to name a few.
  class OpsAggregator
    include JSON::Serializable

    # Either a `Range` or `Count` aggregator for limiting an OpsData summary.
    @[JSON::Field(key: "AggregatorType")]
    property aggregator_type : String | Nil

    # The data type name to use for viewing counts of OpsData.
    @[JSON::Field(key: "TypeName")]
    property type_name : String | Nil

    # The name of an OpsData attribute on which to limit the count of OpsData.
    @[JSON::Field(key: "AttributeName")]
    property attribute_name : String | Nil

    # The aggregator value.
    @[JSON::Field(key: "Values")]
    property values : Hash(String, String) | Nil

    # The aggregator filters.
    @[JSON::Field(key: "Filters")]
    property filters : Array(OpsFilter) | Nil

    # A nested aggregator for viewing counts of OpsData.
    @[JSON::Field(key: "Aggregators")]
    property aggregators : Array(OpsAggregator) | Nil

    def initialize(
      @aggregator_type : String | Nil = nil,
      @type_name : String | Nil = nil,
      @attribute_name : String | Nil = nil,
      @values : Hash(String, String) | Nil = nil,
      @filters : Array(OpsFilter) | Nil = nil,
      @aggregators : Array(OpsAggregator) | Nil = nil,
    )
    end
  end
end
