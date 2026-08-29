private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class NodeAggregator
    include JSON::Serializable

    @[JSON::Field(key: "AggregatorType", converter: AS::NodeAggregatorType)]
    property aggregator_type : NodeAggregatorType

    @[JSON::Field(key: "TypeName", converter: AS::NodeTypeName)]
    property type_name : NodeTypeName

    @[JSON::Field(key: "AttributeName", converter: AS::NodeAttributeName)]
    property attribute_name : NodeAttributeName

    @[JSON::Field(key: "Aggregators")]
    property aggregators : Array(NodeAggregator) | Nil

    def initialize(
      @aggregator_type : NodeAggregatorType,
      @type_name : NodeTypeName,
      @attribute_name : NodeAttributeName,
      @aggregators : Array(NodeAggregator) | Nil = nil,
    )
    end
  end
end
