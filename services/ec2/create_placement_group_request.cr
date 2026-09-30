private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreatePlacementGroupRequest
    # The number of partitions. Valid only when **Strategy** is set to `partition`.
    property partition_count : Int32 | Nil

    # The tags to apply to the new placement group.
    property tag_specifications : Array(TagSpecification) | Nil

    # Determines how placement groups spread instances.
    #
    # - Host – You can use `host` only with Outpost placement groups.
    #
    # - Rack – No usage restrictions.
    property spread_level : SpreadLevel | Nil

    # Reserved for future use.
    property linked_group_id : String | Nil

    # Reserved for internal use.
    property operator : OperatorRequest | Nil

    # The ID of a parent placement group. Valid only when **Strategy** is set to `cluster`.
    property parent_group_id : String | Nil

    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # A name for the placement group. Must be unique within the scope of your account for the Region.
    #
    # Constraints: Up to 255 ASCII characters
    property group_name : String | Nil

    # The placement strategy.
    property strategy : PlacementStrategy | Nil

    def initialize(
      @partition_count : Int32 | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @spread_level : SpreadLevel | Nil = nil,
      @linked_group_id : String | Nil = nil,
      @operator : OperatorRequest | Nil = nil,
      @parent_group_id : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @group_name : String | Nil = nil,
      @strategy : PlacementStrategy | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @partition_count
        params << {"#{prefix}PartitionCount", value.to_s}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
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

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @group_name
        params << {"#{prefix}GroupName", value}
      end

      if value = @strategy
        params << {"#{prefix}Strategy", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        partition_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='PartitionCount']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        spread_level: (n = node.xpath_node("*[local-name()='SpreadLevel']")) ? AEC::SpreadLevel.from_json_object_key?(n.content) : nil,
        linked_group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='LinkedGroupId']")),
        operator: node.xpath_node("*[local-name()='Operator']").try { |n| OperatorRequest.from_xml(n) },
        parent_group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ParentGroupId']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='groupName']")),
        strategy: (n = node.xpath_node("*[local-name()='strategy']")) ? AEC::PlacementStrategy.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end

      if value = @operator
        value.validate!
      end
    end

    def_equals_and_hash(@partition_count, @tag_specifications, @spread_level, @linked_group_id, @operator, @parent_group_id, @dry_run, @group_name, @strategy)
  end
end
