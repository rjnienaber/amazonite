private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetSpotPlacementScoresRequest
    # The instance types. We recommend that you specify at least three instance types. If you specify
    # one or two instance types, or specify variations of a single instance type (for example, an
    # `m3.xlarge` with and without instance storage), the returned placement score will always be low.
    #
    # If you specify `InstanceTypes`, you can't specify `InstanceRequirementsWithMetadata`.
    property instance_types : Array(String) | Nil

    # The target capacity.
    property target_capacity : Int32

    # The unit for the target capacity.
    property target_capacity_unit_type : TargetCapacityUnitType | Nil

    # Specify `true` so that the response returns a list of scored Availability Zones. Otherwise, the
    # response returns a list of scored Regions.
    #
    # A list of scored Availability Zones is useful if you want to launch all of your Spot capacity
    # into a single Availability Zone.
    property single_availability_zone : Bool | Nil

    # The Regions used to narrow down the list of Regions to be scored. Enter the Region code, for
    # example, `us-east-1`.
    property region_names : Array(String) | Nil

    # The attributes for the instance types. When you specify instance attributes, Amazon EC2 will
    # identify instance types with those attributes.
    #
    # If you specify `InstanceRequirementsWithMetadata`, you can't specify `InstanceTypes`.
    property instance_requirements_with_metadata : InstanceRequirementsWithMetadataRequest | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    property max_results : Int32 | Nil

    # The token returned from a previous paginated request. Pagination continues from the end of the
    # items returned by the previous request.
    property next_token : String | Nil

    # Specify `true` so that the response returns scores that include Local Zones. Otherwise, the
    # response ignores Local Zones.
    #
    # When you request regional scores, Local Zone capacity counts toward its parent Region.
    property include_local_zones : Bool | Nil

    def initialize(
      @target_capacity : Int32,
      @instance_types : Array(String) | Nil = nil,
      @target_capacity_unit_type : TargetCapacityUnitType | Nil = nil,
      @single_availability_zone : Bool | Nil = nil,
      @region_names : Array(String) | Nil = nil,
      @instance_requirements_with_metadata : InstanceRequirementsWithMetadataRequest | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @include_local_zones : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@instance_types || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}InstanceType.#{i}", item}
      end

      params << {"#{prefix}TargetCapacity", @target_capacity.to_s}

      if value = @target_capacity_unit_type
        params << {"#{prefix}TargetCapacityUnitType", value.to_json_object_key}
      end

      if value = @single_availability_zone
        params << {"#{prefix}SingleAvailabilityZone", Core::QueryValue.bool(value)}
      end

      (@region_names || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}RegionName.#{i}", item}
      end

      if value = @instance_requirements_with_metadata
        params.concat(value.to_query_params("#{prefix}InstanceRequirementsWithMetadata."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @include_local_zones
        params << {"#{prefix}IncludeLocalZones", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_types: node.xpath_nodes("*[local-name()='InstanceType']/*[local-name()='item']").map { |n| n.content },
        target_capacity: Core::XMLValue.i32(node.xpath_node("*[local-name()='TargetCapacity']")).not_nil!,
        target_capacity_unit_type: (n = node.xpath_node("*[local-name()='TargetCapacityUnitType']")) ? AEC::TargetCapacityUnitType.from_json_object_key?(n.content) : nil,
        single_availability_zone: Core::XMLValue.bool(node.xpath_node("*[local-name()='SingleAvailabilityZone']")),
        region_names: node.xpath_nodes("*[local-name()='RegionName']/*[local-name()='item']").map { |n| n.content },
        instance_requirements_with_metadata: node.xpath_node("*[local-name()='InstanceRequirementsWithMetadata']").try { |n| InstanceRequirementsWithMetadataRequest.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        include_local_zones: Core::XMLValue.bool(node.xpath_node("*[local-name()='IncludeLocalZones']")),
      )
    end

    def validate! : Nil
      if value = @instance_types
        raise Core::ValidationError.new("InstanceTypes must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("InstanceTypes must have at most 1000 item(s)") if value.size > 1000
      end

      if value = @target_capacity
        raise Core::ValidationError.new("TargetCapacity value must be >= 1") if value < 1
        raise Core::ValidationError.new("TargetCapacity value must be <= 2000000000") if value > 2000000000
      end

      if value = @region_names
        raise Core::ValidationError.new("RegionNames must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("RegionNames must have at most 10 item(s)") if value.size > 10
      end

      if value = @instance_requirements_with_metadata
        value.validate!
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 10") if value < 10
        raise Core::ValidationError.new("MaxResults value must be <= 1000") if value > 1000
      end
    end

    def_equals_and_hash(@instance_types, @target_capacity, @target_capacity_unit_type, @single_availability_zone, @region_names, @instance_requirements_with_metadata, @dry_run, @max_results, @next_token, @include_local_zones)
  end
end
