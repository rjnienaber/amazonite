private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a VPC peering connection.
  class VpcPeeringConnection
    # Information about the accepter VPC. CIDR block information is only returned when describing an
    # active VPC peering connection.
    property accepter_vpc_info : VpcPeeringConnectionVpcInfo | Nil

    # The time that an unaccepted VPC peering connection will expire.
    property expiration_time : Time | Nil

    # Information about the requester VPC. CIDR block information is only returned when describing an
    # active VPC peering connection.
    property requester_vpc_info : VpcPeeringConnectionVpcInfo | Nil

    # The status of the VPC peering connection.
    property status : VpcPeeringConnectionStateReason | Nil

    # Any tags assigned to the resource.
    property tags : Array(Tag) | Nil

    # The ID of the VPC peering connection.
    property vpc_peering_connection_id : String | Nil

    def initialize(
      @accepter_vpc_info : VpcPeeringConnectionVpcInfo | Nil = nil,
      @expiration_time : Time | Nil = nil,
      @requester_vpc_info : VpcPeeringConnectionVpcInfo | Nil = nil,
      @status : VpcPeeringConnectionStateReason | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @vpc_peering_connection_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @accepter_vpc_info
        params.concat(value.to_query_params("#{prefix}AccepterVpcInfo."))
      end

      if value = @expiration_time
        params << {"#{prefix}ExpirationTime", Core::QueryValue.time(value)}
      end

      if value = @requester_vpc_info
        params.concat(value.to_query_params("#{prefix}RequesterVpcInfo."))
      end

      if value = @status
        params.concat(value.to_query_params("#{prefix}Status."))
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @vpc_peering_connection_id
        params << {"#{prefix}VpcPeeringConnectionId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        accepter_vpc_info: node.xpath_node("*[local-name()='accepterVpcInfo']").try { |n| VpcPeeringConnectionVpcInfo.from_xml(n) },
        expiration_time: Core::XMLValue.time(node.xpath_node("*[local-name()='expirationTime']")),
        requester_vpc_info: node.xpath_node("*[local-name()='requesterVpcInfo']").try { |n| VpcPeeringConnectionVpcInfo.from_xml(n) },
        status: node.xpath_node("*[local-name()='status']").try { |n| VpcPeeringConnectionStateReason.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        vpc_peering_connection_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcPeeringConnectionId']")),
      )
    end

    def validate! : Nil
      if value = @accepter_vpc_info
        value.validate!
      end

      if value = @requester_vpc_info
        value.validate!
      end

      if value = @status
        value.validate!
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@accepter_vpc_info, @expiration_time, @requester_vpc_info, @status, @tags, @vpc_peering_connection_id)
  end
end
