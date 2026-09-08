private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The number of units to request. You can choose to set the target capacity as the number of
  # instances. Or you can set the target capacity to a performance characteristic that is important
  # to your application workload, such as vCPUs, memory, or I/O. If the request type is `maintain`,
  # you can specify a target capacity of 0 and add capacity later.
  #
  # You can use the On-Demand Instance `MaxTotalPrice` parameter, the Spot Instance `MaxTotalPrice`
  # parameter, or both parameters to ensure that your fleet cost does not exceed your budget. If you
  # set a maximum price per hour for the On-Demand Instances and Spot Instances in your request, EC2
  # Fleet will launch instances until it reaches the maximum amount that you're willing to pay. When
  # the maximum amount you're willing to pay is reached, the fleet stops launching instances even if
  # it hasn't met the target capacity. The `MaxTotalPrice` parameters are located in
  # [OnDemandOptionsRequest](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_OnDemandOptionsRequest)
  # and
  # [SpotOptionsRequest](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_SpotOptionsRequest).
  class TargetCapacitySpecificationRequest
    # The number of units to request, filled using the default target capacity type.
    property total_target_capacity : Int32

    # The number of On-Demand units to request.
    property on_demand_target_capacity : Int32 | Nil

    # The number of Spot units to request.
    property spot_target_capacity : Int32 | Nil

    # The default target capacity type.
    property default_target_capacity_type : DefaultTargetCapacityType | Nil

    # The unit for the target capacity. You can specify this parameter only when using
    # attributed-based instance type selection.
    #
    # Default: `units` (the number of instances)
    property target_capacity_unit_type : TargetCapacityUnitType | Nil

    def initialize(
      @total_target_capacity : Int32,
      @on_demand_target_capacity : Int32 | Nil = nil,
      @spot_target_capacity : Int32 | Nil = nil,
      @default_target_capacity_type : DefaultTargetCapacityType | Nil = nil,
      @target_capacity_unit_type : TargetCapacityUnitType | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TotalTargetCapacity", @total_target_capacity.to_s}

      if value = @on_demand_target_capacity
        params << {"#{prefix}OnDemandTargetCapacity", value.to_s}
      end

      if value = @spot_target_capacity
        params << {"#{prefix}SpotTargetCapacity", value.to_s}
      end

      if value = @default_target_capacity_type
        params << {"#{prefix}DefaultTargetCapacityType", value.to_json_object_key}
      end

      if value = @target_capacity_unit_type
        params << {"#{prefix}TargetCapacityUnitType", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        total_target_capacity: Core::XMLValue.i32(node.xpath_node("*[local-name()='TotalTargetCapacity']")).not_nil!,
        on_demand_target_capacity: Core::XMLValue.i32(node.xpath_node("*[local-name()='OnDemandTargetCapacity']")),
        spot_target_capacity: Core::XMLValue.i32(node.xpath_node("*[local-name()='SpotTargetCapacity']")),
        default_target_capacity_type: (n = node.xpath_node("*[local-name()='DefaultTargetCapacityType']")) ? AEC::DefaultTargetCapacityType.from_json_object_key?(n.content) : nil,
        target_capacity_unit_type: (n = node.xpath_node("*[local-name()='TargetCapacityUnitType']")) ? AEC::TargetCapacityUnitType.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@total_target_capacity, @on_demand_target_capacity, @spot_target_capacity, @default_target_capacity_type, @target_capacity_unit_type)
  end
end
