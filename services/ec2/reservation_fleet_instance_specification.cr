private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about an instance type to use in a Capacity Reservation Fleet.
  class ReservationFleetInstanceSpecification
    # The instance type for which the Capacity Reservation Fleet reserves capacity.
    property instance_type : InstanceType | Nil

    # The type of operating system for which the Capacity Reservation Fleet reserves capacity.
    property instance_platform : CapacityReservationInstancePlatform | Nil

    # The number of capacity units provided by the specified instance type. This value, together with
    # the total target capacity that you specify for the Fleet determine the number of instances for
    # which the Fleet reserves capacity. Both values are based on units that make sense for your
    # workload. For more information, see [Total target
    # capacity](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/crfleet-concepts.html#target-capacity)
    # in the *Amazon EC2 User Guide*.
    property weight : Float64 | Nil

    # The Availability Zone in which the Capacity Reservation Fleet reserves the capacity. A Capacity
    # Reservation Fleet can't span Availability Zones. All instance type specifications that you
    # specify for the Fleet must use the same Availability Zone.
    property availability_zone : String | Nil

    # The ID of the Availability Zone in which the Capacity Reservation Fleet reserves the capacity. A
    # Capacity Reservation Fleet can't span Availability Zones. All instance type specifications that
    # you specify for the Fleet must use the same Availability Zone.
    property availability_zone_id : String | Nil

    # Indicates whether the Capacity Reservation Fleet supports EBS-optimized instances types. This
    # optimization provides dedicated throughput to Amazon EBS and an optimized configuration stack to
    # provide optimal I/O performance. This optimization isn't available with all instance types.
    # Additional usage charges apply when using EBS-optimized instance types.
    property ebs_optimized : Bool | Nil

    # The priority to assign to the instance type. This value is used to determine which of the
    # instance types specified for the Fleet should be prioritized for use. A lower value indicates a
    # high priority. For more information, see [Instance type
    # priority](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/crfleet-concepts.html#instance-priority)
    # in the *Amazon EC2 User Guide*.
    property priority : Int32 | Nil

    def initialize(
      @instance_type : InstanceType | Nil = nil,
      @instance_platform : CapacityReservationInstancePlatform | Nil = nil,
      @weight : Float64 | Nil = nil,
      @availability_zone : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @ebs_optimized : Bool | Nil = nil,
      @priority : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_type
        params << {"#{prefix}InstanceType", value.to_json_object_key}
      end

      if value = @instance_platform
        params << {"#{prefix}InstancePlatform", value.to_json_object_key}
      end

      if value = @weight
        params << {"#{prefix}Weight", value.to_s}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @ebs_optimized
        params << {"#{prefix}EbsOptimized", Core::QueryValue.bool(value)}
      end

      if value = @priority
        params << {"#{prefix}Priority", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_type: (n = node.xpath_node("*[local-name()='InstanceType']")) ? AEC::InstanceType.from_json_object_key?(n.content) : nil,
        instance_platform: (n = node.xpath_node("*[local-name()='InstancePlatform']")) ? AEC::CapacityReservationInstancePlatform.from_json_object_key?(n.content) : nil,
        weight: Core::XMLValue.f64(node.xpath_node("*[local-name()='Weight']")),
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='AvailabilityZone']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AvailabilityZoneId']")),
        ebs_optimized: Core::XMLValue.bool(node.xpath_node("*[local-name()='EbsOptimized']")),
        priority: Core::XMLValue.i32(node.xpath_node("*[local-name()='Priority']")),
      )
    end

    def validate! : Nil
      if value = @weight
        raise Core::ValidationError.new("Weight value must be >= 0.001") if value < 0.001
        raise Core::ValidationError.new("Weight value must be <= 99.999") if value > 99.999
      end

      if value = @priority
        raise Core::ValidationError.new("Priority value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@instance_type, @instance_platform, @weight, @availability_zone, @availability_zone_id, @ebs_optimized, @priority)
  end
end
