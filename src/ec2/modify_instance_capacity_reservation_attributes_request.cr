private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyInstanceCapacityReservationAttributesRequest
    # The ID of the instance to be modified.
    property instance_id : String

    # Information about the Capacity Reservation targeting option.
    property capacity_reservation_specification : CapacityReservationSpecification

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @instance_id : String,
      @capacity_reservation_specification : CapacityReservationSpecification,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}InstanceId", @instance_id}

      params.concat(@capacity_reservation_specification.to_query_params("#{prefix}CapacityReservationSpecification."))

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceId']")).not_nil!,
        capacity_reservation_specification: node.xpath_node("*[local-name()='CapacityReservationSpecification']").try { |n| CapacityReservationSpecification.from_xml(n) }.not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @capacity_reservation_specification
        value.validate!
      end
    end

    def_equals_and_hash(@instance_id, @capacity_reservation_specification, @dry_run)
  end
end
