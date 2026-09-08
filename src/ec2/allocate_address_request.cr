private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class AllocateAddressRequest
    # The network (`vpc`).
    property domain : DomainType | Nil

    # The Elastic IP address to recover or an IPv4 address from an address pool.
    property address : String | Nil

    # The ID of an address pool that you own. Use this parameter to let Amazon EC2 select an address
    # from the address pool. To specify a specific address from the address pool, use the `Address`
    # parameter instead.
    property public_ipv_4_pool : String | Nil

    # A unique set of Availability Zones, Local Zones, or Wavelength Zones from which Amazon Web
    # Services advertises IP addresses. Use this parameter to limit the IP address to this location.
    # IP addresses cannot move between network border groups.
    property network_border_group : String | Nil

    # The ID of a customer-owned address pool. Use this parameter to let Amazon EC2 select an address
    # from the address pool. Alternatively, specify a specific address from the address pool.
    property customer_owned_ipv_4_pool : String | Nil

    # The tags to assign to the Elastic IP address.
    property tag_specifications : Array(TagSpecification) | Nil

    # The ID of an IPAM pool which has an Amazon-provided or BYOIP public IPv4 CIDR provisioned to it.
    # For more information, see [Allocate sequential Elastic IP addresses from an IPAM
    # pool](https://docs.aws.amazon.com/vpc/latest/ipam/tutorials-eip-pool.html) in the *Amazon VPC
    # IPAM User Guide*.
    property ipam_pool_id : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @domain : DomainType | Nil = nil,
      @address : String | Nil = nil,
      @public_ipv_4_pool : String | Nil = nil,
      @network_border_group : String | Nil = nil,
      @customer_owned_ipv_4_pool : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @ipam_pool_id : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @domain
        params << {"#{prefix}Domain", value.to_json_object_key}
      end

      if value = @address
        params << {"#{prefix}Address", value}
      end

      if value = @public_ipv_4_pool
        params << {"#{prefix}PublicIpv4Pool", value}
      end

      if value = @network_border_group
        params << {"#{prefix}NetworkBorderGroup", value}
      end

      if value = @customer_owned_ipv_4_pool
        params << {"#{prefix}CustomerOwnedIpv4Pool", value}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @ipam_pool_id
        params << {"#{prefix}IpamPoolId", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        domain: (n = node.xpath_node("*[local-name()='Domain']")) ? AEC::DomainType.from_json_object_key?(n.content) : nil,
        address: Core::XMLValue.string(node.xpath_node("*[local-name()='Address']")),
        public_ipv_4_pool: Core::XMLValue.string(node.xpath_node("*[local-name()='PublicIpv4Pool']")),
        network_border_group: Core::XMLValue.string(node.xpath_node("*[local-name()='NetworkBorderGroup']")),
        customer_owned_ipv_4_pool: Core::XMLValue.string(node.xpath_node("*[local-name()='CustomerOwnedIpv4Pool']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        ipam_pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamPoolId']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@domain, @address, @public_ipv_4_pool, @network_border_group, @customer_owned_ipv_4_pool, @tag_specifications, @ipam_pool_id, @dry_run)
  end
end
