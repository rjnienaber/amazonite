private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a client connection.
  class ClientVpnConnection
    # The ID of the Client VPN endpoint to which the client is connected.
    property client_vpn_endpoint_id : String | Nil

    # The current date and time.
    property timestamp : String | Nil

    # The ID of the client connection.
    property connection_id : String | Nil

    # The username of the client who established the client connection. This information is only
    # provided if Active Directory client authentication is used.
    property username : String | Nil

    # The date and time the client connection was established.
    property connection_established_time : String | Nil

    # The number of bytes sent by the client.
    property ingress_bytes : String | Nil

    # The number of bytes received by the client.
    property egress_bytes : String | Nil

    # The number of packets sent by the client.
    property ingress_packets : String | Nil

    # The number of packets received by the client.
    property egress_packets : String | Nil

    # The IP address of the client.
    property client_ip : String | Nil

    # The IPv6 address assigned to the client connection when using a dual-stack Client VPN endpoint.
    # This field is only populated when the endpoint is configured for dual-stack addressing, and the
    # client is using IPv6 for connectivity.
    property client_ipv_6_address : String | Nil

    # The common name associated with the client. This is either the name of the client certificate,
    # or the Active Directory user name.
    property common_name : String | Nil

    # The current state of the client connection.
    property status : ClientVpnConnectionStatus | Nil

    # The date and time the client connection was terminated.
    property connection_end_time : String | Nil

    # The statuses returned by the client connect handler for posture compliance, if applicable.
    property posture_compliance_statuses : Array(String) | Nil

    def initialize(
      @client_vpn_endpoint_id : String | Nil = nil,
      @timestamp : String | Nil = nil,
      @connection_id : String | Nil = nil,
      @username : String | Nil = nil,
      @connection_established_time : String | Nil = nil,
      @ingress_bytes : String | Nil = nil,
      @egress_bytes : String | Nil = nil,
      @ingress_packets : String | Nil = nil,
      @egress_packets : String | Nil = nil,
      @client_ip : String | Nil = nil,
      @client_ipv_6_address : String | Nil = nil,
      @common_name : String | Nil = nil,
      @status : ClientVpnConnectionStatus | Nil = nil,
      @connection_end_time : String | Nil = nil,
      @posture_compliance_statuses : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @client_vpn_endpoint_id
        params << {"#{prefix}ClientVpnEndpointId", value}
      end

      if value = @timestamp
        params << {"#{prefix}Timestamp", value}
      end

      if value = @connection_id
        params << {"#{prefix}ConnectionId", value}
      end

      if value = @username
        params << {"#{prefix}Username", value}
      end

      if value = @connection_established_time
        params << {"#{prefix}ConnectionEstablishedTime", value}
      end

      if value = @ingress_bytes
        params << {"#{prefix}IngressBytes", value}
      end

      if value = @egress_bytes
        params << {"#{prefix}EgressBytes", value}
      end

      if value = @ingress_packets
        params << {"#{prefix}IngressPackets", value}
      end

      if value = @egress_packets
        params << {"#{prefix}EgressPackets", value}
      end

      if value = @client_ip
        params << {"#{prefix}ClientIp", value}
      end

      if value = @client_ipv_6_address
        params << {"#{prefix}ClientIpv6Address", value}
      end

      if value = @common_name
        params << {"#{prefix}CommonName", value}
      end

      if value = @status
        params.concat(value.to_query_params("#{prefix}Status."))
      end

      if value = @connection_end_time
        params << {"#{prefix}ConnectionEndTime", value}
      end

      (@posture_compliance_statuses || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}PostureComplianceStatusSet.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_vpn_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='clientVpnEndpointId']")),
        timestamp: Core::XMLValue.string(node.xpath_node("*[local-name()='timestamp']")),
        connection_id: Core::XMLValue.string(node.xpath_node("*[local-name()='connectionId']")),
        username: Core::XMLValue.string(node.xpath_node("*[local-name()='username']")),
        connection_established_time: Core::XMLValue.string(node.xpath_node("*[local-name()='connectionEstablishedTime']")),
        ingress_bytes: Core::XMLValue.string(node.xpath_node("*[local-name()='ingressBytes']")),
        egress_bytes: Core::XMLValue.string(node.xpath_node("*[local-name()='egressBytes']")),
        ingress_packets: Core::XMLValue.string(node.xpath_node("*[local-name()='ingressPackets']")),
        egress_packets: Core::XMLValue.string(node.xpath_node("*[local-name()='egressPackets']")),
        client_ip: Core::XMLValue.string(node.xpath_node("*[local-name()='clientIp']")),
        client_ipv_6_address: Core::XMLValue.string(node.xpath_node("*[local-name()='clientIpv6Address']")),
        common_name: Core::XMLValue.string(node.xpath_node("*[local-name()='commonName']")),
        status: node.xpath_node("*[local-name()='status']").try { |n| ClientVpnConnectionStatus.from_xml(n) },
        connection_end_time: Core::XMLValue.string(node.xpath_node("*[local-name()='connectionEndTime']")),
        posture_compliance_statuses: node.xpath_nodes("*[local-name()='postureComplianceStatusSet']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
      if value = @status
        value.validate!
      end
    end

    def_equals_and_hash(@client_vpn_endpoint_id, @timestamp, @connection_id, @username, @connection_established_time, @ingress_bytes, @egress_bytes, @ingress_packets, @egress_packets, @client_ip, @client_ipv_6_address, @common_name, @status, @connection_end_time, @posture_compliance_statuses)
  end
end
