private alias Core = Amazonite::Core

module Amazonite::EC2
  class MoveCapacityReservationInstancesRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [Ensure
    # Idempotency](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html).
    property client_token : String | Nil

    # The ID of the Capacity Reservation from which you want to move capacity.
    property source_capacity_reservation_id : String

    # The ID of the Capacity Reservation that you want to move capacity into.
    property destination_capacity_reservation_id : String

    # The number of instances that you want to move from the source Capacity Reservation.
    property instance_count : Int32

    def initialize(
      @source_capacity_reservation_id : String,
      @destination_capacity_reservation_id : String,
      @instance_count : Int32,
      @dry_run : Bool | Nil = nil,
      @client_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      params << {"#{prefix}SourceCapacityReservationId", @source_capacity_reservation_id}

      params << {"#{prefix}DestinationCapacityReservationId", @destination_capacity_reservation_id}

      params << {"#{prefix}InstanceCount", @instance_count.to_s}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        source_capacity_reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SourceCapacityReservationId']")).not_nil!,
        destination_capacity_reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='DestinationCapacityReservationId']")).not_nil!,
        instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='InstanceCount']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @client_token, @source_capacity_reservation_id, @destination_capacity_reservation_id, @instance_count)
  end
end
