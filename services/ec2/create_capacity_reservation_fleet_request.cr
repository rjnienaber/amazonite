private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateCapacityReservationFleetRequest
    # The strategy used by the Capacity Reservation Fleet to determine which of the specified instance
    # types to use. Currently, only the `prioritized` allocation strategy is supported. For more
    # information, see [ Allocation
    # strategy](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/crfleet-concepts.html#allocation-strategy)
    # in the *Amazon EC2 User Guide*.
    #
    # Valid values: `prioritized`
    property allocation_strategy : String | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [Ensure
    # Idempotency](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html).
    property client_token : String | Nil

    # Information about the instance types for which to reserve the capacity.
    property instance_type_specifications : Array(ReservationFleetInstanceSpecification) | Nil

    # Indicates the tenancy of the Capacity Reservation Fleet. All Capacity Reservations in the Fleet
    # inherit this tenancy. The Capacity Reservation Fleet can have one of the following tenancy
    # settings:
    #
    # - `default` - The Capacity Reservation Fleet is created on hardware that is shared with other
    # Amazon Web Services accounts.
    #
    # - `dedicated` - The Capacity Reservations are created on single-tenant hardware that is
    # dedicated to a single Amazon Web Services account.
    property tenancy : FleetCapacityReservationTenancy | Nil

    # The total number of capacity units to be reserved by the Capacity Reservation Fleet. This value,
    # together with the instance type weights that you assign to each instance type used by the Fleet
    # determine the number of instances for which the Fleet reserves capacity. Both values are based
    # on units that make sense for your workload. For more information, see [Total target
    # capacity](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/crfleet-concepts.html#target-capacity)
    # in the *Amazon EC2 User Guide*.
    property total_target_capacity : Int32

    # The date and time at which the Capacity Reservation Fleet expires. When the Capacity Reservation
    # Fleet expires, its state changes to `expired` and all of the Capacity Reservations in the Fleet
    # expire.
    #
    # The Capacity Reservation Fleet expires within an hour after the specified time. For example, if
    # you specify `5/31/2019`, `13:30:55`, the Capacity Reservation Fleet is guaranteed to expire
    # between `13:30:55` and `14:30:55` on `5/31/2019`.
    property end_date : Time | Nil

    # Indicates the type of instance launches that the Capacity Reservation Fleet accepts. All
    # Capacity Reservations in the Fleet inherit this instance matching criteria.
    #
    # Currently, Capacity Reservation Fleets support `open` instance matching criteria only. This
    # means that instances that have matching attributes (instance type, platform, and Availability
    # Zone) run in the Capacity Reservations automatically. Instances do not need to explicitly target
    # a Capacity Reservation Fleet to use its reserved capacity.
    property instance_match_criteria : FleetInstanceMatchCriteria | Nil

    # The tags to assign to the Capacity Reservation Fleet. The tags are automatically assigned to the
    # Capacity Reservations in the Fleet.
    property tag_specifications : Array(TagSpecification) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @total_target_capacity : Int32,
      @allocation_strategy : String | Nil = nil,
      @client_token : String | Nil = nil,
      @instance_type_specifications : Array(ReservationFleetInstanceSpecification) | Nil = nil,
      @tenancy : FleetCapacityReservationTenancy | Nil = nil,
      @end_date : Time | Nil = nil,
      @instance_match_criteria : FleetInstanceMatchCriteria | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @allocation_strategy
        params << {"#{prefix}AllocationStrategy", value}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      (@instance_type_specifications || [] of ReservationFleetInstanceSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}InstanceTypeSpecification.#{i}."))
      end

      if value = @tenancy
        params << {"#{prefix}Tenancy", value.to_json_object_key}
      end

      params << {"#{prefix}TotalTargetCapacity", @total_target_capacity.to_s}

      if value = @end_date
        params << {"#{prefix}EndDate", Core::QueryValue.time(value)}
      end

      if value = @instance_match_criteria
        params << {"#{prefix}InstanceMatchCriteria", value.to_json_object_key}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        allocation_strategy: Core::XMLValue.string(node.xpath_node("*[local-name()='AllocationStrategy']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        instance_type_specifications: node.xpath_nodes("*[local-name()='InstanceTypeSpecification']/*[local-name()='item']").map { |n| ReservationFleetInstanceSpecification.from_xml(n) },
        tenancy: (n = node.xpath_node("*[local-name()='Tenancy']")) ? AEC::FleetCapacityReservationTenancy.from_json_object_key?(n.content) : nil,
        total_target_capacity: Core::XMLValue.i32(node.xpath_node("*[local-name()='TotalTargetCapacity']")).not_nil!,
        end_date: Core::XMLValue.time(node.xpath_node("*[local-name()='EndDate']")),
        instance_match_criteria: (n = node.xpath_node("*[local-name()='InstanceMatchCriteria']")) ? AEC::FleetInstanceMatchCriteria.from_json_object_key?(n.content) : nil,
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @instance_type_specifications
        value.each(&.validate!)
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@allocation_strategy, @client_token, @instance_type_specifications, @tenancy, @total_target_capacity, @end_date, @instance_match_criteria, @tag_specifications, @dry_run)
  end
end
