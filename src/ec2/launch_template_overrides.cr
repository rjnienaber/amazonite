private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes overrides for a launch template.
  class LaunchTemplateOverrides
    # The instance type.
    property instance_type : InstanceType | Nil

    # The maximum price per unit hour that you are willing to pay for a Spot Instance. We do not
    # recommend using this parameter because it can lead to increased interruptions. If you do not
    # specify this parameter, you will pay the current Spot price.
    #
    # If you specify a maximum price, your instances will be interrupted more frequently than if you
    # do not specify this parameter.
    property spot_price : String | Nil

    # The ID of the subnet in which to launch the instances.
    property subnet_id : String | Nil

    # The Availability Zone in which to launch the instances. For example, `us-east-2a`.
    #
    # Either `AvailabilityZone` or `AvailabilityZoneId` must be specified in the request, but not
    # both.
    property availability_zone : String | Nil

    # The number of units provided by the specified instance type. These are the same units that you
    # chose to set the target capacity in terms of instances, or a performance characteristic such as
    # vCPUs, memory, or I/O.
    #
    # If the target capacity divided by this value is not a whole number, Amazon EC2 rounds the number
    # of instances to the next whole number. If this value is not specified, the default is 1.
    #
    # When specifying weights, the price used in the `lowestPrice` and `priceCapacityOptimized`
    # allocation strategies is per *unit* hour (where the instance price is divided by the specified
    # weight). However, if all the specified weights are above the requested `TargetCapacity`,
    # resulting in only 1 instance being launched, the price used is per *instance* hour.
    property weighted_capacity : Float64 | Nil

    # The priority for the launch template override. The highest priority is launched first.
    #
    # If `OnDemandAllocationStrategy` is set to `prioritized`, Spot Fleet uses priority to determine
    # which launch template override to use first in fulfilling On-Demand capacity.
    #
    # If the Spot `AllocationStrategy` is set to `capacityOptimizedPrioritized`, Spot Fleet uses
    # priority on a best-effort basis to determine which launch template override to use in fulfilling
    # Spot capacity, but optimizes for capacity first.
    #
    # Valid values are whole numbers starting at `0`. The lower the number, the higher the priority.
    # If no number is set, the launch template override has the lowest priority. You can set the same
    # priority for different launch template overrides.
    property priority : Float64 | Nil

    # The instance requirements. When you specify instance requirements, Amazon EC2 will identify
    # instance types with the provided requirements, and then use your On-Demand and Spot allocation
    # strategies to launch instances from these instance types, in the same way as when you specify a
    # list of instance types.
    #
    # If you specify `InstanceRequirements`, you can't specify `InstanceType`.
    property instance_requirements : InstanceRequirements | Nil

    # The ID of the Availability Zone in which to launch the instances. For example, `use2-az1`.
    #
    # Either `AvailabilityZone` or `AvailabilityZoneId` must be specified in the request, but not
    # both.
    property availability_zone_id : String | Nil

    def initialize(
      @instance_type : InstanceType | Nil = nil,
      @spot_price : String | Nil = nil,
      @subnet_id : String | Nil = nil,
      @availability_zone : String | Nil = nil,
      @weighted_capacity : Float64 | Nil = nil,
      @priority : Float64 | Nil = nil,
      @instance_requirements : InstanceRequirements | Nil = nil,
      @availability_zone_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_type
        params << {"#{prefix}InstanceType", value.to_json_object_key}
      end

      if value = @spot_price
        params << {"#{prefix}SpotPrice", value}
      end

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @weighted_capacity
        params << {"#{prefix}WeightedCapacity", value.to_s}
      end

      if value = @priority
        params << {"#{prefix}Priority", value.to_s}
      end

      if value = @instance_requirements
        params.concat(value.to_query_params("#{prefix}InstanceRequirements."))
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_type: (n = node.xpath_node("*[local-name()='instanceType']")) ? AEC::InstanceType.from_json_object_key?(n.content) : nil,
        spot_price: Core::XMLValue.string(node.xpath_node("*[local-name()='spotPrice']")),
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='subnetId']")),
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        weighted_capacity: Core::XMLValue.f64(node.xpath_node("*[local-name()='weightedCapacity']")),
        priority: Core::XMLValue.f64(node.xpath_node("*[local-name()='priority']")),
        instance_requirements: node.xpath_node("*[local-name()='instanceRequirements']").try { |n| InstanceRequirements.from_xml(n) },
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
      )
    end

    def validate! : Nil
      if value = @instance_requirements
        value.validate!
      end
    end

    def_equals_and_hash(@instance_type, @spot_price, @subnet_id, @availability_zone, @weighted_capacity, @priority, @instance_requirements, @availability_zone_id)
  end
end
