private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeCapacityReservationBillingRequestsResult
    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    # Information about the request.
    property capacity_reservation_billing_requests : Array(CapacityReservationBillingRequest) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @capacity_reservation_billing_requests : Array(CapacityReservationBillingRequest) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@capacity_reservation_billing_requests || [] of CapacityReservationBillingRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}CapacityReservationBillingRequestSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        capacity_reservation_billing_requests: node.xpath_nodes("*[local-name()='capacityReservationBillingRequestSet']/*[local-name()='item']").map { |n| CapacityReservationBillingRequest.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @capacity_reservation_billing_requests
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @capacity_reservation_billing_requests)
  end
end
