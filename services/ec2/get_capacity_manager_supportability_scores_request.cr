private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetCapacityManagerSupportabilityScoresRequest
    # The capacity market to score.
    property market_type : SupportabilityMarketType

    # The amount of capacity that you need, in the unit that you specify for `CapacityUnit`. Each
    # score is relative to this amount.
    property capacity_amount : Int32

    # The unit for `CapacityAmount`.
    property capacity_unit : CapacityUnit

    # The IDs of the Availability Zones to score, such as `use1-az1`. You can specify Availability
    # Zones in different Regions. You can specify up to 10 Availability Zones.
    property capacity_availability_zone_ids : Array(String) = [] of String

    # The instance types to score. You can specify up to 50 instance types.
    #
    # Specify either `InstanceTypes` or `InstanceRequirementsWithMetadata`, but not both.
    property instance_types : Array(String) | Nil

    # The attributes that the instance types must have, such as vCPU and memory ranges. Capacity
    # Manager resolves the attributes into matching instance types and scores each one.
    #
    # Specify either `InstanceTypes` or `InstanceRequirementsWithMetadata`, but not both.
    property instance_requirements_with_metadata : InstanceRequirementsWithMetadataRequest | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @market_type : SupportabilityMarketType,
      @capacity_amount : Int32,
      @capacity_unit : CapacityUnit,
      @capacity_availability_zone_ids : Array(String),
      @instance_types : Array(String) | Nil = nil,
      @instance_requirements_with_metadata : InstanceRequirementsWithMetadataRequest | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}MarketType", @market_type.to_json_object_key}

      params << {"#{prefix}CapacityAmount", @capacity_amount.to_s}

      params << {"#{prefix}CapacityUnit", @capacity_unit.to_json_object_key}

      @capacity_availability_zone_ids.each_with_index(1) do |item, i|
        params << {"#{prefix}CapacityAvailabilityZoneId.#{i}", item}
      end

      (@instance_types || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}InstanceType.#{i}", item}
      end

      if value = @instance_requirements_with_metadata
        params.concat(value.to_query_params("#{prefix}InstanceRequirementsWithMetadata."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        market_type: ((n = node.xpath_node("*[local-name()='MarketType']")) ? AEC::SupportabilityMarketType.from_json_object_key?(n.content) : nil).not_nil!,
        capacity_amount: Core::XMLValue.i32(node.xpath_node("*[local-name()='CapacityAmount']")).not_nil!,
        capacity_unit: ((n = node.xpath_node("*[local-name()='CapacityUnit']")) ? AEC::CapacityUnit.from_json_object_key?(n.content) : nil).not_nil!,
        capacity_availability_zone_ids: node.xpath_nodes("*[local-name()='CapacityAvailabilityZoneId']/*[local-name()='item']").map { |n| n.content },
        instance_types: node.xpath_nodes("*[local-name()='InstanceType']/*[local-name()='item']").map { |n| n.content },
        instance_requirements_with_metadata: node.xpath_node("*[local-name()='InstanceRequirementsWithMetadata']").try { |n| InstanceRequirementsWithMetadataRequest.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @capacity_amount
        raise Core::ValidationError.new("CapacityAmount value must be >= 1") if value < 1
      end

      if value = @capacity_availability_zone_ids
        raise Core::ValidationError.new("CapacityAvailabilityZoneIds must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("CapacityAvailabilityZoneIds must have at most 10 item(s)") if value.size > 10
      end

      if value = @instance_types
        raise Core::ValidationError.new("InstanceTypes must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("InstanceTypes must have at most 50 item(s)") if value.size > 50
      end

      if value = @instance_requirements_with_metadata
        value.validate!
      end
    end

    def_equals_and_hash(@market_type, @capacity_amount, @capacity_unit, @capacity_availability_zone_ids, @instance_types, @instance_requirements_with_metadata, @dry_run)
  end
end
