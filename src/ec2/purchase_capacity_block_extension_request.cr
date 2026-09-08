private alias Core = Amazonite::Core

module Amazonite::EC2
  class PurchaseCapacityBlockExtensionRequest
    # The ID of the Capacity Block extension offering to purchase.
    property capacity_block_extension_offering_id : String

    # The ID of the Capacity reservation to be extended.
    property capacity_reservation_id : String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @capacity_block_extension_offering_id : String,
      @capacity_reservation_id : String,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}CapacityBlockExtensionOfferingId", @capacity_block_extension_offering_id}

      params << {"#{prefix}CapacityReservationId", @capacity_reservation_id}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_block_extension_offering_id: Core::XMLValue.string(node.xpath_node("*[local-name()='CapacityBlockExtensionOfferingId']")).not_nil!,
        capacity_reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='CapacityReservationId']")).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@capacity_block_extension_offering_id, @capacity_reservation_id, @dry_run)
  end
end
