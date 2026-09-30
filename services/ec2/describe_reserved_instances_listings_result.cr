private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the output of DescribeReservedInstancesListings.
  class DescribeReservedInstancesListingsResult
    # Information about the Reserved Instance listing.
    property reserved_instances_listings : Array(ReservedInstancesListing) | Nil

    def initialize(
      @reserved_instances_listings : Array(ReservedInstancesListing) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@reserved_instances_listings || [] of ReservedInstancesListing).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ReservedInstancesListingsSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        reserved_instances_listings: node.xpath_nodes("*[local-name()='reservedInstancesListingsSet']/*[local-name()='item']").map { |n| ReservedInstancesListing.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @reserved_instances_listings
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@reserved_instances_listings)
  end
end
