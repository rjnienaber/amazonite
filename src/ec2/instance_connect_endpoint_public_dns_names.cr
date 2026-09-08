private alias Core = Amazonite::Core

module Amazonite::EC2
  # The public DNS names of the endpoint, including IPv4-only and dualstack DNS names.
  class InstanceConnectEndpointPublicDnsNames
    # The IPv4-only DNS name of the EC2 Instance Connect Endpoint.
    property ipv_4 : InstanceConnectEndpointDnsNames | Nil

    # The dualstack DNS name of the EC2 Instance Connect Endpoint. A dualstack DNS name supports
    # connections from both IPv4 and IPv6 clients.
    property dualstack : InstanceConnectEndpointDnsNames | Nil

    def initialize(
      @ipv_4 : InstanceConnectEndpointDnsNames | Nil = nil,
      @dualstack : InstanceConnectEndpointDnsNames | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipv_4
        params.concat(value.to_query_params("#{prefix}Ipv4."))
      end

      if value = @dualstack
        params.concat(value.to_query_params("#{prefix}Dualstack."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipv_4: node.xpath_node("*[local-name()='ipv4']").try { |n| InstanceConnectEndpointDnsNames.from_xml(n) },
        dualstack: node.xpath_node("*[local-name()='dualstack']").try { |n| InstanceConnectEndpointDnsNames.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ipv_4
        value.validate!
      end

      if value = @dualstack
        value.validate!
      end
    end

    def_equals_and_hash(@ipv_4, @dualstack)
  end
end
