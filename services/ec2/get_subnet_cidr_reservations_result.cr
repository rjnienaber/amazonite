private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetSubnetCidrReservationsResult
    # Information about the IPv4 subnet CIDR reservations.
    property subnet_ipv_4_cidr_reservations : Array(SubnetCidrReservation) | Nil

    # Information about the IPv6 subnet CIDR reservations.
    property subnet_ipv_6_cidr_reservations : Array(SubnetCidrReservation) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @subnet_ipv_4_cidr_reservations : Array(SubnetCidrReservation) | Nil = nil,
      @subnet_ipv_6_cidr_reservations : Array(SubnetCidrReservation) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@subnet_ipv_4_cidr_reservations || [] of SubnetCidrReservation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SubnetIpv4CidrReservationSet.#{i}."))
      end

      (@subnet_ipv_6_cidr_reservations || [] of SubnetCidrReservation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SubnetIpv6CidrReservationSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        subnet_ipv_4_cidr_reservations: node.xpath_nodes("*[local-name()='subnetIpv4CidrReservationSet']/*[local-name()='item']").map { |n| SubnetCidrReservation.from_xml(n) },
        subnet_ipv_6_cidr_reservations: node.xpath_nodes("*[local-name()='subnetIpv6CidrReservationSet']/*[local-name()='item']").map { |n| SubnetCidrReservation.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @subnet_ipv_4_cidr_reservations
        value.each(&.validate!)
      end

      if value = @subnet_ipv_6_cidr_reservations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@subnet_ipv_4_cidr_reservations, @subnet_ipv_6_cidr_reservations, @next_token)
  end
end
