private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeHostReservationOfferingsResult
    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    # Information about the offerings.
    property offering_set : Array(HostOffering) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @offering_set : Array(HostOffering) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@offering_set || [] of HostOffering).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}OfferingSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        offering_set: node.xpath_nodes("*[local-name()='offeringSet']/*[local-name()='item']").map { |n| HostOffering.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @offering_set
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @offering_set)
  end
end
