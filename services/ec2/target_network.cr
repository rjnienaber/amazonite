private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a target network associated with a Client VPN endpoint.
  class TargetNetwork
    # The ID of the association.
    property association_id : String | Nil

    # The ID of the VPC in which the target network (subnet) is located.
    property vpc_id : String | Nil

    # The ID of the subnet specified as the target network.
    property target_network_id : String | Nil

    # The ID of the Client VPN endpoint with which the target network is associated.
    property client_vpn_endpoint_id : String | Nil

    # The current state of the target network association.
    property status : AssociationStatus | Nil

    # The IDs of the security groups applied to the target network association.
    property security_groups : Array(String) | Nil

    # The Availability Zone names for the target network association, if the Client VPN endpoint uses
    # a Transit Gateway.
    property availability_zones : Array(String) | Nil

    # The Availability Zone IDs for the target network association, if the Client VPN endpoint uses a
    # Transit Gateway.
    property availability_zone_ids : Array(String) | Nil

    def initialize(
      @association_id : String | Nil = nil,
      @vpc_id : String | Nil = nil,
      @target_network_id : String | Nil = nil,
      @client_vpn_endpoint_id : String | Nil = nil,
      @status : AssociationStatus | Nil = nil,
      @security_groups : Array(String) | Nil = nil,
      @availability_zones : Array(String) | Nil = nil,
      @availability_zone_ids : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @association_id
        params << {"#{prefix}AssociationId", value}
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end

      if value = @target_network_id
        params << {"#{prefix}TargetNetworkId", value}
      end

      if value = @client_vpn_endpoint_id
        params << {"#{prefix}ClientVpnEndpointId", value}
      end

      if value = @status
        params.concat(value.to_query_params("#{prefix}Status."))
      end

      (@security_groups || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SecurityGroups.#{i}", item}
      end

      (@availability_zones || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AvailabilityZoneSet.#{i}", item}
      end

      (@availability_zone_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AvailabilityZoneIdSet.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        association_id: Core::XMLValue.string(node.xpath_node("*[local-name()='associationId']")),
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
        target_network_id: Core::XMLValue.string(node.xpath_node("*[local-name()='targetNetworkId']")),
        client_vpn_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='clientVpnEndpointId']")),
        status: node.xpath_node("*[local-name()='status']").try { |n| AssociationStatus.from_xml(n) },
        security_groups: node.xpath_nodes("*[local-name()='securityGroups']/*[local-name()='item']").map { |n| n.content },
        availability_zones: node.xpath_nodes("*[local-name()='availabilityZoneSet']/*[local-name()='item']").map { |n| n.content },
        availability_zone_ids: node.xpath_nodes("*[local-name()='availabilityZoneIdSet']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
      if value = @status
        value.validate!
      end
    end

    def_equals_and_hash(@association_id, @vpc_id, @target_network_id, @client_vpn_endpoint_id, @status, @security_groups, @availability_zones, @availability_zone_ids)
  end
end
