private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeCapacityReservationDateChangeQuotesResult
    # Information about the Capacity Reservation date change quotes.
    property capacity_reservation_modification_quotes : Array(CapacityReservationModificationQuote) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @capacity_reservation_modification_quotes : Array(CapacityReservationModificationQuote) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@capacity_reservation_modification_quotes || [] of CapacityReservationModificationQuote).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}CapacityReservationModificationQuoteSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_reservation_modification_quotes: node.xpath_nodes("*[local-name()='capacityReservationModificationQuoteSet']/*[local-name()='item']").map { |n| CapacityReservationModificationQuote.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @capacity_reservation_modification_quotes
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@capacity_reservation_modification_quotes, @next_token)
  end
end
