private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a Capacity Reservation.
  class CapacityReservation
    # The ID of the Capacity Reservation.
    property capacity_reservation_id : String | Nil

    # The ID of the Amazon Web Services account that owns the Capacity Reservation.
    property owner_id : String | Nil

    # The Amazon Resource Name (ARN) of the Capacity Reservation.
    property capacity_reservation_arn : String | Nil

    # The ID of the Availability Zone in which the capacity is reserved.
    property availability_zone_id : String | Nil

    # The type of instance for which the Capacity Reservation reserves capacity.
    property instance_type : String | Nil

    # The type of operating system for which the Capacity Reservation reserves capacity.
    property instance_platform : CapacityReservationInstancePlatform | Nil

    # The Availability Zone in which the capacity is reserved.
    property availability_zone : String | Nil

    # Indicates the tenancy of the Capacity Reservation. A Capacity Reservation can have one of the
    # following tenancy settings:
    #
    # - `default` - The Capacity Reservation is created on hardware that is shared with other Amazon
    # Web Services accounts.
    #
    # - `dedicated` - The Capacity Reservation is created on single-tenant hardware that is dedicated
    # to a single Amazon Web Services account.
    property tenancy : CapacityReservationTenancy | Nil

    # The total number of instances for which the Capacity Reservation reserves capacity.
    property total_instance_count : Int32 | Nil

    # The remaining capacity. Indicates the number of instances that can be launched in the Capacity
    # Reservation.
    property available_instance_count : Int32 | Nil

    # Indicates whether the Capacity Reservation supports EBS-optimized instances. This optimization
    # provides dedicated throughput to Amazon EBS and an optimized configuration stack to provide
    # optimal I/O performance. This optimization isn't available with all instance types. Additional
    # usage charges apply when using an EBS- optimized instance.
    property ebs_optimized : Bool | Nil

    # *Deprecated.*
    property ephemeral_storage : Bool | Nil

    # The current state of the Capacity Reservation. A Capacity Reservation can be in one of the
    # following states:
    #
    # - `active` - The capacity is available for use.
    #
    # - `expired` - The Capacity Reservation expired automatically at the date and time specified in
    # your reservation request. The reserved capacity is no longer available for your use.
    #
    # - `cancelled` - The Capacity Reservation was canceled. The reserved capacity is no longer
    # available for your use.
    #
    # - `pending` - The Capacity Reservation request was successful but the capacity provisioning is
    # still pending.
    #
    # - `failed` - The Capacity Reservation request has failed. A request can fail due to request
    # parameters that are not valid, capacity constraints, or instance limit constraints. You can view
    # a failed request for 60 minutes.
    #
    # - `scheduled` - (*Future-dated Capacity Reservations*) The future-dated Capacity Reservation
    # request was approved and the Capacity Reservation is scheduled for delivery on the requested
    # start date.
    #
    # - `payment-pending` - (*Capacity Blocks*) The upfront payment has not been processed yet.
    #
    # - `payment-failed` - (*Capacity Blocks*) The upfront payment was not processed in the 12-hour
    # time frame. Your Capacity Block was released.
    #
    # - `assessing` - (*Future-dated Capacity Reservations*) Amazon EC2 is assessing your request for
    # a future-dated Capacity Reservation.
    #
    # - `delayed` - (*Future-dated Capacity Reservations*) Amazon EC2 encountered a delay in
    # provisioning the requested future-dated Capacity Reservation. Amazon EC2 is unable to deliver
    # the requested capacity by the requested start date and time.
    #
    # - `unsupported` - (*Future-dated Capacity Reservations*) Amazon EC2 can't support the
    # future-dated Capacity Reservation request due to capacity constraints. You can view unsupported
    # requests for 30 days. The Capacity Reservation will not be delivered.
    #
    # - `cancelling` - (*Future-dated Capacity Reservations*) The Capacity Reservation is being
    # cancelled. Capacity has been released but charges continue for the commitment wind-down period.
    # The reservation transitions to `cancelled` when the wind-down completes.
    property state : CapacityReservationState | Nil

    # The date and time the Capacity Reservation was started.
    property start_date : Time | Nil

    # The date and time the Capacity Reservation expires. When a Capacity Reservation expires, the
    # reserved capacity is released and you can no longer launch instances into it. The Capacity
    # Reservation's state changes to `expired` when it reaches its end date and time.
    property end_date : Time | Nil

    # Indicates the way in which the Capacity Reservation ends. A Capacity Reservation can have one of
    # the following end types:
    #
    # - `unlimited` - The Capacity Reservation remains active until you explicitly cancel it.
    #
    # - `limited` - The Capacity Reservation expires automatically at a specified date and time.
    property end_date_type : EndDateType | Nil

    # Indicates the type of instance launches that the Capacity Reservation accepts. The options
    # include:
    #
    # - `open` - The Capacity Reservation accepts all instances that have matching attributes
    # (instance type, platform, and Availability Zone). Instances that have matching attributes launch
    # into the Capacity Reservation automatically without specifying any additional parameters.
    #
    # - `targeted` - The Capacity Reservation only accepts instances that have matching attributes
    # (instance type, platform, and Availability Zone), and explicitly target the Capacity
    # Reservation. This ensures that only permitted instances can use the reserved capacity.
    property instance_match_criteria : InstanceMatchCriteria | Nil

    # The date and time the Capacity Reservation was created.
    property create_date : Time | Nil

    # Any tags assigned to the Capacity Reservation.
    property tags : Array(Tag) | Nil

    # The Amazon Resource Name (ARN) of the Outpost on which the Capacity Reservation was created.
    property outpost_arn : String | Nil

    # The ID of the Capacity Reservation Fleet to which the Capacity Reservation belongs. Only valid
    # for Capacity Reservations that were created by a Capacity Reservation Fleet.
    property capacity_reservation_fleet_id : String | Nil

    # The Amazon Resource Name (ARN) of the cluster placement group in which the Capacity Reservation
    # was created. For more information, see [ Capacity Reservations for cluster placement
    # groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/cr-cpg.html) in the *Amazon EC2 User
    # Guide*.
    property placement_group_arn : String | Nil

    # Information about instance capacity usage.
    property capacity_allocations : Array(CapacityAllocation) | Nil

    # The type of Capacity Reservation.
    property reservation_type : CapacityReservationType | Nil

    # The ID of the Amazon Web Services account to which billing of the unused capacity of the
    # Capacity Reservation is assigned.
    property unused_reservation_billing_owner_id : String | Nil

    # Information about your commitment for a future-dated Capacity Reservation.
    property commitment_info : CapacityReservationCommitmentInfo | Nil

    # The delivery method for a future-dated Capacity Reservation. `incremental` indicates that the
    # requested capacity is delivered in addition to any running instances and reserved capacity that
    # you have in your account at the requested date and time.
    property delivery_preference : CapacityReservationDeliveryPreference | Nil

    # The ID of the Capacity Block.
    property capacity_block_id : String | Nil

    # Indicates whether this Capacity Reservation is interruptible, meaning instances may be
    # terminated when the owner reclaims capacity.
    property interruptible : Bool | Nil

    # Contains allocation details for interruptible reservations, including current allocated
    # instances and target instance counts within the interruptibleCapacityAllocation object.
    property interruptible_capacity_allocation : InterruptibleCapacityAllocation | Nil

    # Information about the interruption configuration and association with the source reservation for
    # interruptible Capacity Reservations.
    property interruption_info : InterruptionInfo | Nil

    # The zero-size preference configured for the interruptible Capacity Reservation. A value of
    # `retain` keeps the interruptible Capacity Reservation active at zero capacity when you reduce
    # its allocation to zero. A value of `default` cancels the interruptible Capacity Reservation when
    # you reduce its allocation to zero.
    property zero_size_preference : ZeroSizePreference | Nil

    def initialize(
      @capacity_reservation_id : String | Nil = nil,
      @owner_id : String | Nil = nil,
      @capacity_reservation_arn : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @instance_type : String | Nil = nil,
      @instance_platform : CapacityReservationInstancePlatform | Nil = nil,
      @availability_zone : String | Nil = nil,
      @tenancy : CapacityReservationTenancy | Nil = nil,
      @total_instance_count : Int32 | Nil = nil,
      @available_instance_count : Int32 | Nil = nil,
      @ebs_optimized : Bool | Nil = nil,
      @ephemeral_storage : Bool | Nil = nil,
      @state : CapacityReservationState | Nil = nil,
      @start_date : Time | Nil = nil,
      @end_date : Time | Nil = nil,
      @end_date_type : EndDateType | Nil = nil,
      @instance_match_criteria : InstanceMatchCriteria | Nil = nil,
      @create_date : Time | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @outpost_arn : String | Nil = nil,
      @capacity_reservation_fleet_id : String | Nil = nil,
      @placement_group_arn : String | Nil = nil,
      @capacity_allocations : Array(CapacityAllocation) | Nil = nil,
      @reservation_type : CapacityReservationType | Nil = nil,
      @unused_reservation_billing_owner_id : String | Nil = nil,
      @commitment_info : CapacityReservationCommitmentInfo | Nil = nil,
      @delivery_preference : CapacityReservationDeliveryPreference | Nil = nil,
      @capacity_block_id : String | Nil = nil,
      @interruptible : Bool | Nil = nil,
      @interruptible_capacity_allocation : InterruptibleCapacityAllocation | Nil = nil,
      @interruption_info : InterruptionInfo | Nil = nil,
      @zero_size_preference : ZeroSizePreference | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @capacity_reservation_id
        params << {"#{prefix}CapacityReservationId", value}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @capacity_reservation_arn
        params << {"#{prefix}CapacityReservationArn", value}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @instance_type
        params << {"#{prefix}InstanceType", value}
      end

      if value = @instance_platform
        params << {"#{prefix}InstancePlatform", value.to_json_object_key}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @tenancy
        params << {"#{prefix}Tenancy", value.to_json_object_key}
      end

      if value = @total_instance_count
        params << {"#{prefix}TotalInstanceCount", value.to_s}
      end

      if value = @available_instance_count
        params << {"#{prefix}AvailableInstanceCount", value.to_s}
      end

      if value = @ebs_optimized
        params << {"#{prefix}EbsOptimized", Core::QueryValue.bool(value)}
      end

      if value = @ephemeral_storage
        params << {"#{prefix}EphemeralStorage", Core::QueryValue.bool(value)}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @start_date
        params << {"#{prefix}StartDate", Core::QueryValue.time(value)}
      end

      if value = @end_date
        params << {"#{prefix}EndDate", Core::QueryValue.time(value)}
      end

      if value = @end_date_type
        params << {"#{prefix}EndDateType", value.to_json_object_key}
      end

      if value = @instance_match_criteria
        params << {"#{prefix}InstanceMatchCriteria", value.to_json_object_key}
      end

      if value = @create_date
        params << {"#{prefix}CreateDate", Core::QueryValue.time(value)}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @outpost_arn
        params << {"#{prefix}OutpostArn", value}
      end

      if value = @capacity_reservation_fleet_id
        params << {"#{prefix}CapacityReservationFleetId", value}
      end

      if value = @placement_group_arn
        params << {"#{prefix}PlacementGroupArn", value}
      end

      (@capacity_allocations || [] of CapacityAllocation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}CapacityAllocationSet.#{i}."))
      end

      if value = @reservation_type
        params << {"#{prefix}ReservationType", value.to_json_object_key}
      end

      if value = @unused_reservation_billing_owner_id
        params << {"#{prefix}UnusedReservationBillingOwnerId", value}
      end

      if value = @commitment_info
        params.concat(value.to_query_params("#{prefix}CommitmentInfo."))
      end

      if value = @delivery_preference
        params << {"#{prefix}DeliveryPreference", value.to_json_object_key}
      end

      if value = @capacity_block_id
        params << {"#{prefix}CapacityBlockId", value}
      end

      if value = @interruptible
        params << {"#{prefix}Interruptible", Core::QueryValue.bool(value)}
      end

      if value = @interruptible_capacity_allocation
        params.concat(value.to_query_params("#{prefix}InterruptibleCapacityAllocation."))
      end

      if value = @interruption_info
        params.concat(value.to_query_params("#{prefix}InterruptionInfo."))
      end

      if value = @zero_size_preference
        params << {"#{prefix}ZeroSizePreference", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='capacityReservationId']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        capacity_reservation_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='capacityReservationArn']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
        instance_type: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceType']")),
        instance_platform: (n = node.xpath_node("*[local-name()='instancePlatform']")) ? AEC::CapacityReservationInstancePlatform.from_json_object_key?(n.content) : nil,
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        tenancy: (n = node.xpath_node("*[local-name()='tenancy']")) ? AEC::CapacityReservationTenancy.from_json_object_key?(n.content) : nil,
        total_instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='totalInstanceCount']")),
        available_instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='availableInstanceCount']")),
        ebs_optimized: Core::XMLValue.bool(node.xpath_node("*[local-name()='ebsOptimized']")),
        ephemeral_storage: Core::XMLValue.bool(node.xpath_node("*[local-name()='ephemeralStorage']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::CapacityReservationState.from_json_object_key?(n.content) : nil,
        start_date: Core::XMLValue.time(node.xpath_node("*[local-name()='startDate']")),
        end_date: Core::XMLValue.time(node.xpath_node("*[local-name()='endDate']")),
        end_date_type: (n = node.xpath_node("*[local-name()='endDateType']")) ? AEC::EndDateType.from_json_object_key?(n.content) : nil,
        instance_match_criteria: (n = node.xpath_node("*[local-name()='instanceMatchCriteria']")) ? AEC::InstanceMatchCriteria.from_json_object_key?(n.content) : nil,
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='createDate']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        outpost_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='outpostArn']")),
        capacity_reservation_fleet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='capacityReservationFleetId']")),
        placement_group_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='placementGroupArn']")),
        capacity_allocations: node.xpath_nodes("*[local-name()='capacityAllocationSet']/*[local-name()='item']").map { |n| CapacityAllocation.from_xml(n) },
        reservation_type: (n = node.xpath_node("*[local-name()='reservationType']")) ? AEC::CapacityReservationType.from_json_object_key?(n.content) : nil,
        unused_reservation_billing_owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='unusedReservationBillingOwnerId']")),
        commitment_info: node.xpath_node("*[local-name()='commitmentInfo']").try { |n| CapacityReservationCommitmentInfo.from_xml(n) },
        delivery_preference: (n = node.xpath_node("*[local-name()='deliveryPreference']")) ? AEC::CapacityReservationDeliveryPreference.from_json_object_key?(n.content) : nil,
        capacity_block_id: Core::XMLValue.string(node.xpath_node("*[local-name()='capacityBlockId']")),
        interruptible: Core::XMLValue.bool(node.xpath_node("*[local-name()='interruptible']")),
        interruptible_capacity_allocation: node.xpath_node("*[local-name()='interruptibleCapacityAllocation']").try { |n| InterruptibleCapacityAllocation.from_xml(n) },
        interruption_info: node.xpath_node("*[local-name()='interruptionInfo']").try { |n| InterruptionInfo.from_xml(n) },
        zero_size_preference: (n = node.xpath_node("*[local-name()='zeroSizePreference']")) ? AEC::ZeroSizePreference.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end

      if value = @outpost_arn
        raise Core::ValidationError.new("OutpostArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws([a-z-]+)?:outposts:[a-z\\d-]+:\\d{12}:outpost/op-[a-f0-9]{17}$"))
      end

      if value = @placement_group_arn
        raise Core::ValidationError.new("PlacementGroupArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws([a-z-]+)?:ec2:[a-z\\d-]+:\\d{12}:placement-group/^.{1,255}$"))
      end

      if value = @capacity_allocations
        value.each(&.validate!)
      end

      if value = @unused_reservation_billing_owner_id
        raise Core::ValidationError.new("UnusedReservationBillingOwnerId length must be >= 12") if value.size < 12
        raise Core::ValidationError.new("UnusedReservationBillingOwnerId length must be <= 12") if value.size > 12
        raise Core::ValidationError.new("UnusedReservationBillingOwnerId does not match the required pattern") unless value.matches?(Regex.new("^[0-9]{12}$"))
      end

      if value = @commitment_info
        value.validate!
      end

      if value = @interruptible_capacity_allocation
        value.validate!
      end

      if value = @interruption_info
        value.validate!
      end
    end

    def_equals_and_hash(@capacity_reservation_id, @owner_id, @capacity_reservation_arn, @availability_zone_id, @instance_type, @instance_platform, @availability_zone, @tenancy, @total_instance_count, @available_instance_count, @ebs_optimized, @ephemeral_storage, @state, @start_date, @end_date, @end_date_type, @instance_match_criteria, @create_date, @tags, @outpost_arn, @capacity_reservation_fleet_id, @placement_group_arn, @capacity_allocations, @reservation_type, @unused_reservation_billing_owner_id, @commitment_info, @delivery_preference, @capacity_block_id, @interruptible, @interruptible_capacity_allocation, @interruption_info, @zero_size_preference)
  end
end
