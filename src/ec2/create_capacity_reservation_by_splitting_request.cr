private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateCapacityReservationBySplittingRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [Ensure
    # Idempotency](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html).
    property client_token : String | Nil

    # The ID of the Capacity Reservation from which you want to split the capacity.
    property source_capacity_reservation_id : String

    # The number of instances to split from the source Capacity Reservation.
    property instance_count : Int32

    # The tags to apply to the new Capacity Reservation.
    property tag_specifications : Array(TagSpecification) | Nil

    def initialize(
      @source_capacity_reservation_id : String,
      @instance_count : Int32,
      @dry_run : Bool | Nil = nil,
      @client_token : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
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

      params << {"#{prefix}InstanceCount", @instance_count.to_s}

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        source_capacity_reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SourceCapacityReservationId']")).not_nil!,
        instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='InstanceCount']")).not_nil!,
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @client_token, @source_capacity_reservation_id, @instance_count, @tag_specifications)
  end
end
