private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # One or more aggregators for viewing counts of nodes using different dimensions.
  class NodeAggregator
    include JSON::Serializable

    # The aggregator type for limiting a node summary. Currently, only `Count` is supported.
    @[JSON::Field(key: "AggregatorType", converter: AS::NodeAggregatorType)]
    property aggregator_type : NodeAggregatorType

    # The data type name to use for viewing counts of nodes. Currently, only `Instance` is supported.
    @[JSON::Field(key: "TypeName", converter: AS::NodeTypeName)]
    property type_name : NodeTypeName

    # The name of a node attribute on which to limit the count of nodes.
    @[JSON::Field(key: "AttributeName", converter: AS::NodeAttributeName)]
    property attribute_name : NodeAttributeName

    # Information about aggregators used to refine a node summary.
    @[JSON::Field(key: "Aggregators")]
    property aggregators : Array(NodeAggregator) | Nil

    def initialize(
      @aggregator_type : NodeAggregatorType,
      @type_name : NodeTypeName,
      @attribute_name : NodeAttributeName,
      @aggregators : Array(NodeAggregator) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @aggregators
        raise Core::ValidationError.new("Aggregators must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Aggregators must have at most 2 item(s)") if value.size > 2
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@aggregator_type, @type_name, @attribute_name, @aggregators)
  end
end
