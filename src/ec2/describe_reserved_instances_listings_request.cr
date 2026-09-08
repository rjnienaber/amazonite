private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for DescribeReservedInstancesListings.
  class DescribeReservedInstancesListingsRequest
    # One or more Reserved Instance IDs.
    property reserved_instances_id : String | Nil

    # One or more Reserved Instance listing IDs.
    property reserved_instances_listing_id : String | Nil

    # One or more filters.
    #
    # - `reserved-instances-id` - The ID of the Reserved Instances.
    #
    # - `reserved-instances-listing-id` - The ID of the Reserved Instances listing.
    #
    # - `status` - The status of the Reserved Instance listing (`pending` | `active` | `cancelled` |
    # `closed`).
    #
    # - `status-message` - The reason for the status.
    property filters : Array(Filter) | Nil

    def initialize(
      @reserved_instances_id : String | Nil = nil,
      @reserved_instances_listing_id : String | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @reserved_instances_id
        params << {"#{prefix}ReservedInstancesId", value}
      end

      if value = @reserved_instances_listing_id
        params << {"#{prefix}ReservedInstancesListingId", value}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        reserved_instances_id: Core::XMLValue.string(node.xpath_node("*[local-name()='reservedInstancesId']")),
        reserved_instances_listing_id: Core::XMLValue.string(node.xpath_node("*[local-name()='reservedInstancesListingId']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@reserved_instances_id, @reserved_instances_listing_id, @filters)
  end
end
