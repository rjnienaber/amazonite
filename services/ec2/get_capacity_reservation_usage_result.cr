private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetCapacityReservationUsageResult
    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    # The ID of the Capacity Reservation.
    property capacity_reservation_id : String | Nil

    # The type of instance for which the Capacity Reservation reserves capacity.
    property instance_type : String | Nil

    # The number of instances for which the Capacity Reservation reserves capacity.
    property total_instance_count : Int32 | Nil

    # The remaining capacity. Indicates the number of instances that can be launched in the Capacity
    # Reservation.
    property available_instance_count : Int32 | Nil

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

    # Information about the Capacity Reservation usage.
    property instance_usages : Array(InstanceUsage) | Nil

    # Indicates whether the Capacity Reservation is interruptible, meaning instances may be terminated
    # when the owner reclaims capacity.
    property interruptible : Bool | Nil

    # Information about the capacity allocated to the interruptible Capacity Reservation, including
    # instance counts and allocation status.
    property interruptible_capacity_allocation : InterruptibleCapacityAllocation | Nil

    # Details about the interruption configuration and source reservation for interruptible Capacity
    # Reservations.
    property interruption_info : InterruptionInfo | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @capacity_reservation_id : String | Nil = nil,
      @instance_type : String | Nil = nil,
      @total_instance_count : Int32 | Nil = nil,
      @available_instance_count : Int32 | Nil = nil,
      @state : CapacityReservationState | Nil = nil,
      @instance_usages : Array(InstanceUsage) | Nil = nil,
      @interruptible : Bool | Nil = nil,
      @interruptible_capacity_allocation : InterruptibleCapacityAllocation | Nil = nil,
      @interruption_info : InterruptionInfo | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @capacity_reservation_id
        params << {"#{prefix}CapacityReservationId", value}
      end

      if value = @instance_type
        params << {"#{prefix}InstanceType", value}
      end

      if value = @total_instance_count
        params << {"#{prefix}TotalInstanceCount", value.to_s}
      end

      if value = @available_instance_count
        params << {"#{prefix}AvailableInstanceCount", value.to_s}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      (@instance_usages || [] of InstanceUsage).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}InstanceUsageSet.#{i}."))
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
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        capacity_reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='capacityReservationId']")),
        instance_type: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceType']")),
        total_instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='totalInstanceCount']")),
        available_instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='availableInstanceCount']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::CapacityReservationState.from_json_object_key?(n.content) : nil,
        instance_usages: node.xpath_nodes("*[local-name()='instanceUsageSet']/*[local-name()='item']").map { |n| InstanceUsage.from_xml(n) },
        interruptible: Core::XMLValue.bool(node.xpath_node("*[local-name()='interruptible']")),
        interruptible_capacity_allocation: node.xpath_node("*[local-name()='interruptibleCapacityAllocation']").try { |n| InterruptibleCapacityAllocation.from_xml(n) },
        interruption_info: node.xpath_node("*[local-name()='interruptionInfo']").try { |n| InterruptionInfo.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @instance_usages
        value.each(&.validate!)
      end

      if value = @interruptible_capacity_allocation
        value.validate!
      end

      if value = @interruption_info
        value.validate!
      end
    end

    def_equals_and_hash(@next_token, @capacity_reservation_id, @instance_type, @total_instance_count, @available_instance_count, @state, @instance_usages, @interruptible, @interruptible_capacity_allocation, @interruption_info)
  end
end
