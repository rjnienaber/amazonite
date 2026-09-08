private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The number of units to request. You can choose to set the target capacity in terms of instances
  # or a performance characteristic that is important to your application workload, such as vCPUs,
  # memory, or I/O. If the request type is `maintain`, you can specify a target capacity of 0 and
  # add capacity later.
  #
  # You can use the On-Demand Instance `MaxTotalPrice` parameter, the Spot Instance `MaxTotalPrice`,
  # or both to ensure that your fleet cost does not exceed your budget. If you set a maximum price
  # per hour for the On-Demand Instances and Spot Instances in your request, EC2 Fleet will launch
  # instances until it reaches the maximum amount that you're willing to pay. When the maximum
  # amount you're willing to pay is reached, the fleet stops launching instances even if it hasn’t
  # met the target capacity. The `MaxTotalPrice` parameters are located in
  # [OnDemandOptions](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_OnDemandOptions.html)
  # and [SpotOptions](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_SpotOptions).
  class TargetCapacitySpecification
    # The number of units to request, filled the default target capacity type.
    property total_target_capacity : Int32 | Nil

    # The number of On-Demand units to request. If you specify a target capacity for Spot units, you
    # cannot specify a target capacity for On-Demand units.
    property on_demand_target_capacity : Int32 | Nil

    # The maximum number of Spot units to launch. If you specify a target capacity for On-Demand
    # units, you cannot specify a target capacity for Spot units.
    property spot_target_capacity : Int32 | Nil

    # The default target capacity type.
    property default_target_capacity_type : DefaultTargetCapacityType | Nil

    # The unit for the target capacity.
    property target_capacity_unit_type : TargetCapacityUnitType | Nil

    def initialize(
      @total_target_capacity : Int32 | Nil = nil,
      @on_demand_target_capacity : Int32 | Nil = nil,
      @spot_target_capacity : Int32 | Nil = nil,
      @default_target_capacity_type : DefaultTargetCapacityType | Nil = nil,
      @target_capacity_unit_type : TargetCapacityUnitType | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @total_target_capacity
        params << {"#{prefix}TotalTargetCapacity", value.to_s}
      end

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
        total_target_capacity: Core::XMLValue.i32(node.xpath_node("*[local-name()='totalTargetCapacity']")),
        on_demand_target_capacity: Core::XMLValue.i32(node.xpath_node("*[local-name()='onDemandTargetCapacity']")),
        spot_target_capacity: Core::XMLValue.i32(node.xpath_node("*[local-name()='spotTargetCapacity']")),
        default_target_capacity_type: (n = node.xpath_node("*[local-name()='defaultTargetCapacityType']")) ? AEC::DefaultTargetCapacityType.from_json_object_key?(n.content) : nil,
        target_capacity_unit_type: (n = node.xpath_node("*[local-name()='targetCapacityUnitType']")) ? AEC::TargetCapacityUnitType.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@total_target_capacity, @on_demand_target_capacity, @spot_target_capacity, @default_target_capacity_type, @target_capacity_unit_type)
  end
end
