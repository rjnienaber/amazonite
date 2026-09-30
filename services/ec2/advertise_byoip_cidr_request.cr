private alias Core = Amazonite::Core

module Amazonite::EC2
  class AdvertiseByoipCidrRequest
    # The address range, in CIDR notation. This must be the exact range that you provisioned. You
    # can't advertise only a portion of the provisioned range.
    property cidr : String

    # The public 2-byte or 4-byte ASN that you want to advertise.
    property asn : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

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
      @asn : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @network_border_group : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Cidr", @cidr}

      if value = @asn
        params << {"#{prefix}Asn", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @network_border_group
        params << {"#{prefix}NetworkBorderGroup", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='Cidr']")).not_nil!,
        asn: Core::XMLValue.string(node.xpath_node("*[local-name()='Asn']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        network_border_group: Core::XMLValue.string(node.xpath_node("*[local-name()='NetworkBorderGroup']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@cidr, @asn, @dry_run, @network_border_group)
  end
end
