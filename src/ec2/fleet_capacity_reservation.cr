private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about a Capacity Reservation in a Capacity Reservation Fleet.
  class FleetCapacityReservation
    # The ID of the Capacity Reservation.
    property capacity_reservation_id : String | Nil

    # The ID of the Availability Zone in which the Capacity Reservation reserves capacity.
    property availability_zone_id : String | Nil

    # The instance type for which the Capacity Reservation reserves capacity.
    property instance_type : InstanceType | Nil

    # The type of operating system for which the Capacity Reservation reserves capacity.
    property instance_platform : CapacityReservationInstancePlatform | Nil

    # The Availability Zone in which the Capacity Reservation reserves capacity.
    property availability_zone : String | Nil

    # The total number of instances for which the Capacity Reservation reserves capacity.
    property total_instance_count : Int32 | Nil

    # The number of capacity units fulfilled by the Capacity Reservation. For more information, see
    # [Total target
    # capacity](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/crfleet-concepts.html#target-capacity)
    # in the *Amazon EC2 User Guide*.
    property fulfilled_capacity : Float64 | Nil

    # Indicates whether the Capacity Reservation reserves capacity for EBS-optimized instance types.
    property ebs_optimized : Bool | Nil

    # The date and time at which the Capacity Reservation was created.
    property create_date : Time | Nil

    # The weight of the instance type in the Capacity Reservation Fleet. For more information, see
    # [Instance type
    # weight](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/crfleet-concepts.html#instance-weight)
    # in the *Amazon EC2 User Guide*.
    property weight : Float64 | Nil

    # The priority of the instance type in the Capacity Reservation Fleet. For more information, see
    # [Instance type
    # priority](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/crfleet-concepts.html#instance-priority)
    # in the *Amazon EC2 User Guide*.
    property priority : Int32 | Nil

    def initialize(
      @capacity_reservation_id : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @instance_type : InstanceType | Nil = nil,
      @instance_platform : CapacityReservationInstancePlatform | Nil = nil,
      @availability_zone : String | Nil = nil,
      @total_instance_count : Int32 | Nil = nil,
      @fulfilled_capacity : Float64 | Nil = nil,
      @ebs_optimized : Bool | Nil = nil,
      @create_date : Time | Nil = nil,
      @weight : Float64 | Nil = nil,
      @priority : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @capacity_reservation_id
        params << {"#{prefix}CapacityReservationId", value}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @instance_type
        params << {"#{prefix}InstanceType", value.to_json_object_key}
      end

      if value = @instance_platform
        params << {"#{prefix}InstancePlatform", value.to_json_object_key}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @total_instance_count
        params << {"#{prefix}TotalInstanceCount", value.to_s}
      end

      if value = @fulfilled_capacity
        params << {"#{prefix}FulfilledCapacity", value.to_s}
      end

      if value = @ebs_optimized
        params << {"#{prefix}EbsOptimized", Core::QueryValue.bool(value)}
      end

      if value = @create_date
        params << {"#{prefix}CreateDate", Core::QueryValue.time(value)}
      end

      if value = @weight
        params << {"#{prefix}Weight", value.to_s}
      end

      if value = @priority
        params << {"#{prefix}Priority", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='capacityReservationId']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
        instance_type: (n = node.xpath_node("*[local-name()='instanceType']")) ? AEC::InstanceType.from_json_object_key?(n.content) : nil,
        instance_platform: (n = node.xpath_node("*[local-name()='instancePlatform']")) ? AEC::CapacityReservationInstancePlatform.from_json_object_key?(n.content) : nil,
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        total_instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='totalInstanceCount']")),
        fulfilled_capacity: Core::XMLValue.f64(node.xpath_node("*[local-name()='fulfilledCapacity']")),
        ebs_optimized: Core::XMLValue.bool(node.xpath_node("*[local-name()='ebsOptimized']")),
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='createDate']")),
        weight: Core::XMLValue.f64(node.xpath_node("*[local-name()='weight']")),
        priority: Core::XMLValue.i32(node.xpath_node("*[local-name()='priority']")),
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

    def_equals_and_hash(@capacity_reservation_id, @availability_zone_id, @instance_type, @instance_platform, @availability_zone, @total_instance_count, @fulfilled_capacity, @ebs_optimized, @create_date, @weight, @priority)
  end
end
