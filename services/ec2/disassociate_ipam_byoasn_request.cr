private alias Core = Amazonite::Core

module Amazonite::EC2
  class DisassociateIpamByoasnRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # A public 2-byte or 4-byte ASN.
    property asn : String

    # A BYOIP CIDR.
    property cidr : String

    def initialize(
      @asn : String,
      @cidr : String,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}Asn", @asn}

      params << {"#{prefix}Cidr", @cidr}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        asn: Core::XMLValue.string(node.xpath_node("*[local-name()='Asn']")).not_nil!,
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='Cidr']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @asn, @cidr)
  end
end
