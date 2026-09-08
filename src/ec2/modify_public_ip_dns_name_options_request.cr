private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyPublicIpDnsNameOptionsRequest
    # A network interface ID.
    property network_interface_id : String

    # The public hostname type. For more information, see [EC2 instance hostnames, DNS names, and
    # domains](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-naming.html) in the
    # *Amazon EC2 User Guide*.
    #
    # - `public-dual-stack-dns-name`: A dual-stack public hostname for a network interface. Requests
    # from within the VPC resolve to both the private IPv4 address and the IPv6 Global Unicast Address
    # of the network interface. Requests from the internet resolve to both the public IPv4 and the
    # IPv6 GUA address of the network interface.
    #
    # - `public-ipv4-dns-name`: An IPv4-enabled public hostname for a network interface. Requests from
    # within the VPC resolve to the private primary IPv4 address of the network interface. Requests
    # from the internet resolve to the public IPv4 address of the network interface.
    #
    # - `public-ipv6-dns-name`: An IPv6-enabled public hostname for a network interface. Requests from
    # within the VPC or from the internet resolve to the IPv6 GUA of the network interface.
    property hostname_type : PublicIpDnsOption

    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @network_interface_id : String,
      @hostname_type : PublicIpDnsOption,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}NetworkInterfaceId", @network_interface_id}

      params << {"#{prefix}HostnameType", @hostname_type.to_json_object_key}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='NetworkInterfaceId']")).not_nil!,
        hostname_type: ((n = node.xpath_node("*[local-name()='HostnameType']")) ? AEC::PublicIpDnsOption.from_json_object_key?(n.content) : nil).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@network_interface_id, @hostname_type, @dry_run)
  end
end
