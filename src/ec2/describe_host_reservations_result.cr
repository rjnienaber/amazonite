private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeHostReservationsResult
    # Details about the reservation's configuration.
    property host_reservation_set : Array(HostReservation) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @host_reservation_set : Array(HostReservation) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@host_reservation_set || [] of HostReservation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}HostReservationSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        host_reservation_set: node.xpath_nodes("*[local-name()='hostReservationSet']/*[local-name()='item']").map { |n| HostReservation.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @host_reservation_set
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@host_reservation_set, @next_token)
  end
end
