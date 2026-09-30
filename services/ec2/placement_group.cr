private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a placement group.
  class PlacementGroup
    # The name of the placement group.
    property group_name : String | Nil

    # The state of the placement group.
    property state : PlacementGroupState | Nil

    # The placement strategy.
    property strategy : PlacementStrategy | Nil

    # The number of partitions. Valid only if **strategy** is set to `partition`.
    property partition_count : Int32 | Nil

    # The ID of the placement group.
    property group_id : String | Nil

    # Any tags applied to the placement group.
    property tags : Array(Tag) | Nil

    # The Amazon Resource Name (ARN) of the placement group.
    property group_arn : String | Nil

    # The spread level for the placement group. *Only* Outpost placement groups can be spread across
    # hosts.
    property spread_level : SpreadLevel | Nil

    # Reserved for future use.
    property linked_group_id : String | Nil

    # The service provider that manages the Placement Group.
    property operator : OperatorResponse | Nil

    # The ID of the parent placement group.
    property parent_group_id : String | Nil

    def initialize(
      @group_name : String | Nil = nil,
      @state : PlacementGroupState | Nil = nil,
      @strategy : PlacementStrategy | Nil = nil,
      @partition_count : Int32 | Nil = nil,
      @group_id : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @group_arn : String | Nil = nil,
      @spread_level : SpreadLevel | Nil = nil,
      @linked_group_id : String | Nil = nil,
      @operator : OperatorResponse | Nil = nil,
      @parent_group_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @group_name
        params << {"#{prefix}GroupName", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @strategy
        params << {"#{prefix}Strategy", value.to_json_object_key}
      end

      if value = @partition_count
        params << {"#{prefix}PartitionCount", value.to_s}
      end

      if value = @group_id
        params << {"#{prefix}GroupId", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @group_arn
        params << {"#{prefix}GroupArn", value}
      end

      if value = @spread_level
        params << {"#{prefix}SpreadLevel", value.to_json_object_key}
      end

      if value = @linked_group_id
        params << {"#{prefix}LinkedGroupId", value}
      end

      if value = @operator
        params.concat(value.to_query_params("#{prefix}Operator."))
      end

      if value = @parent_group_id
        params << {"#{prefix}ParentGroupId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='groupName']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::PlacementGroupState.from_json_object_key?(n.content) : nil,
        strategy: (n = node.xpath_node("*[local-name()='strategy']")) ? AEC::PlacementStrategy.from_json_object_key?(n.content) : nil,
        partition_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='partitionCount']")),
        group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='groupId']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        group_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='groupArn']")),
        spread_level: (n = node.xpath_node("*[local-name()='spreadLevel']")) ? AEC::SpreadLevel.from_json_object_key?(n.content) : nil,
        linked_group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='linkedGroupId']")),
        operator: node.xpath_node("*[local-name()='operator']").try { |n| OperatorResponse.from_xml(n) },
        parent_group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='parentGroupId']")),
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end

      if value = @operator
        value.validate!
      end
    end

    def_equals_and_hash(@group_name, @state, @strategy, @partition_count, @group_id, @tags, @group_arn, @spread_level, @linked_group_id, @operator, @parent_group_id)
  end
end
