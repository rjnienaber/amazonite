private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the output of DescribeReservedInstancesOfferings.
  class DescribeReservedInstancesOfferingsResult
    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    # A list of Reserved Instances offerings.
    property reserved_instances_offerings : Array(ReservedInstancesOffering) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @reserved_instances_offerings : Array(ReservedInstancesOffering) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@reserved_instances_offerings || [] of ReservedInstancesOffering).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ReservedInstancesOfferingsSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        reserved_instances_offerings: node.xpath_nodes("*[local-name()='reservedInstancesOfferingsSet']/*[local-name()='item']").map { |n| ReservedInstancesOffering.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @reserved_instances_offerings
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @reserved_instances_offerings)
  end
end
