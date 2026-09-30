private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for CancelReservedInstancesListing.
  class CancelReservedInstancesListingRequest
    # The ID of the Reserved Instance listing.
    property reserved_instances_listing_id : String

    def initialize(
      @reserved_instances_listing_id : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ReservedInstancesListingId", @reserved_instances_listing_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        reserved_instances_listing_id: Core::XMLValue.string(node.xpath_node("*[local-name()='reservedInstancesListingId']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@reserved_instances_listing_id)
  end
end
