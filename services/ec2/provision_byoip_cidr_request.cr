private alias Core = Amazonite::Core

module Amazonite::EC2
  class ProvisionByoipCidrRequest
    # The public IPv4 or IPv6 address range, in CIDR notation. The most specific IPv4 prefix that you
    # can specify is /24. The most specific IPv6 address range that you can bring is /48 for CIDRs
    # that are publicly advertisable and /56 for CIDRs that are not publicly advertisable. The address
    # range cannot overlap with another address range that you've brought to this or another Region.
    property cidr : String

    # A signed document that proves that you are authorized to bring the specified IP address range to
    # Amazon using BYOIP.
    property cidr_authorization_context : CidrAuthorizationContext | Nil

    # (IPv6 only) Indicate whether the address range will be publicly advertised to the internet.
    #
    # Default: true
    property publicly_advertisable : Bool | Nil

    # A description for the address range and the address pool.
    property description : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The tags to apply to the address pool.
    property pool_tag_specifications : Array(TagSpecification) | Nil

    # Reserved.
    property multi_region : Bool | Nil

    # If you have [Local
    # Zones](https://docs.aws.amazon.com/local-zones/latest/ug/how-local-zones-work.html) enabled, you
    # can choose a network border group for Local Zones when you provision and advertise a BYOIPv4
    # CIDR. Choose the network border group carefully as the EIP and the Amazon Web Services resource
    # it is associated with must reside in the same network border group.
    #
    # You can provision BYOIP address ranges to and advertise them in the following Local Zone network
    # border groups:
    #
    # - us-east-1-dfw-2
    #
    # - us-west-2-lax-1
    #
    # - us-west-2-phx-2
    #
    # You cannot provision or advertise BYOIPv6 address ranges in Local Zones at this time.
    property network_border_group : String | Nil

    def initialize(
      @cidr : String,
      @cidr_authorization_context : CidrAuthorizationContext | Nil = nil,
      @publicly_advertisable : Bool | Nil = nil,
      @description : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @pool_tag_specifications : Array(TagSpecification) | Nil = nil,
      @multi_region : Bool | Nil = nil,
      @network_border_group : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Cidr", @cidr}

      if value = @cidr_authorization_context
        params.concat(value.to_query_params("#{prefix}CidrAuthorizationContext."))
      end

      if value = @publicly_advertisable
        params << {"#{prefix}PubliclyAdvertisable", Core::QueryValue.bool(value)}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@pool_tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PoolTagSpecification.#{i}."))
      end

      if value = @multi_region
        params << {"#{prefix}MultiRegion", Core::QueryValue.bool(value)}
      end

      if value = @network_border_group
        params << {"#{prefix}NetworkBorderGroup", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='Cidr']")).not_nil!,
        cidr_authorization_context: node.xpath_node("*[local-name()='CidrAuthorizationContext']").try { |n| CidrAuthorizationContext.from_xml(n) },
        publicly_advertisable: Core::XMLValue.bool(node.xpath_node("*[local-name()='PubliclyAdvertisable']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        pool_tag_specifications: node.xpath_nodes("*[local-name()='PoolTagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        multi_region: Core::XMLValue.bool(node.xpath_node("*[local-name()='MultiRegion']")),
        network_border_group: Core::XMLValue.string(node.xpath_node("*[local-name()='NetworkBorderGroup']")),
      )
    end

    def validate! : Nil
      if value = @cidr_authorization_context
        value.validate!
      end

      if value = @pool_tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@cidr, @cidr_authorization_context, @publicly_advertisable, @description, @dry_run, @pool_tag_specifications, @multi_region, @network_border_group)
  end
end
