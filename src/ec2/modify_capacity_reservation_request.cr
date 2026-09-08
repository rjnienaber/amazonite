private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyCapacityReservationRequest
    # The ID of the Capacity Reservation.
    property capacity_reservation_id : String

    # The number of instances for which to reserve capacity. The number of instances can't be
    # increased or decreased by more than `1000` in a single request.
    property instance_count : Int32 | Nil

    # The date and time at which the Capacity Reservation expires. When a Capacity Reservation
    # expires, the reserved capacity is released and you can no longer launch instances into it. The
    # Capacity Reservation's state changes to `expired` when it reaches its end date and time.
    #
    # The Capacity Reservation is cancelled within an hour from the specified time. For example, if
    # you specify 5/31/2019, 13:30:55, the Capacity Reservation is guaranteed to end between 13:30:55
    # and 14:30:55 on 5/31/2019.
    #
    # You must provide an `EndDate` value if `EndDateType` is `limited`. Omit `EndDate` if
    # `EndDateType` is `unlimited`.
    property end_date : Time | Nil

    # Indicates the way in which the Capacity Reservation ends. A Capacity Reservation can have one of
    # the following end types:
    #
    # - `unlimited` - The Capacity Reservation remains active until you explicitly cancel it. Do not
    # provide an `EndDate` value if `EndDateType` is `unlimited`.
    #
    # - `limited` - The Capacity Reservation expires automatically at a specified date and time. You
    # must provide an `EndDate` value if `EndDateType` is `limited`.
    property end_date_type : EndDateType | Nil

    # Reserved. Capacity Reservations you have created are accepted by default.
    property accept : Bool | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Reserved for future use.
    property additional_info : String | Nil

    # The matching criteria (instance eligibility) that you want to use in the modified Capacity
    # Reservation. If you change the instance eligibility of an existing Capacity Reservation from
    # `targeted` to `open`, any running instances that match the attributes of the Capacity
    # Reservation, have the `CapacityReservationPreference` set to `open`, and are not yet running in
    # the Capacity Reservation, will automatically use the modified Capacity Reservation.
    #
    # To modify the instance eligibility, the Capacity Reservation must be completely idle (zero
    # usage).
    property instance_match_criteria : InstanceMatchCriteria | Nil

    def initialize(
      @capacity_reservation_id : String,
      @instance_count : Int32 | Nil = nil,
      @end_date : Time | Nil = nil,
      @end_date_type : EndDateType | Nil = nil,
      @accept : Bool | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @additional_info : String | Nil = nil,
      @instance_match_criteria : InstanceMatchCriteria | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}CapacityReservationId", @capacity_reservation_id}

      if value = @instance_count
        params << {"#{prefix}InstanceCount", value.to_s}
      end

      if value = @end_date
        params << {"#{prefix}EndDate", Core::QueryValue.time(value)}
      end

      if value = @end_date_type
        params << {"#{prefix}EndDateType", value.to_json_object_key}
      end

      if value = @accept
        params << {"#{prefix}Accept", Core::QueryValue.bool(value)}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @additional_info
        params << {"#{prefix}AdditionalInfo", value}
      end

      if value = @instance_match_criteria
        params << {"#{prefix}InstanceMatchCriteria", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='CapacityReservationId']")).not_nil!,
        instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='InstanceCount']")),
        end_date: Core::XMLValue.time(node.xpath_node("*[local-name()='EndDate']")),
        end_date_type: (n = node.xpath_node("*[local-name()='EndDateType']")) ? AEC::EndDateType.from_json_object_key?(n.content) : nil,
        accept: Core::XMLValue.bool(node.xpath_node("*[local-name()='Accept']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        additional_info: Core::XMLValue.string(node.xpath_node("*[local-name()='AdditionalInfo']")),
        instance_match_criteria: (n = node.xpath_node("*[local-name()='InstanceMatchCriteria']")) ? AEC::InstanceMatchCriteria.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@capacity_reservation_id, @instance_count, @end_date, @end_date_type, @accept, @dry_run, @additional_info, @instance_match_criteria)
  end
end
