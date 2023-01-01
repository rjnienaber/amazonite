module Amazonite::SsmV1
  class OpsAggregator
    include JSON::Serializable

    @[JSON::Field(key: "AggregatorType")]
    property aggregator_type : String | Nil

    @[JSON::Field(key: "TypeName")]
    property type_name : String | Nil

    @[JSON::Field(key: "AttributeName")]
    property attribute_name : String | Nil

    @[JSON::Field(key: "Values")]
    property values : Hash(String, String) | Nil

    @[JSON::Field(key: "Filters")]
    property filters : Array(OpsFilter) | Nil

    @[JSON::Field(key: "Aggregators")]
    property aggregators : Array(OpsAggregator) | Nil

    def initialize(
      @aggregator_type : String | Nil = nil,
      @type_name : String | Nil = nil,
      @attribute_name : String | Nil = nil,
      @values : Hash(String, String) | Nil = nil,
      @filters : Array(OpsFilter) | Nil = nil,
      @aggregators : Array(OpsAggregator) | Nil = nil
    )
    end
  end
end
