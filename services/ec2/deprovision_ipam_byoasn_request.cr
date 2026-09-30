private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeprovisionIpamByoasnRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The IPAM ID.
    property ipam_id : String

    # An ASN.
    property asn : String

    def initialize(
      @ipam_id : String,
      @asn : String,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}IpamId", @ipam_id}

      params << {"#{prefix}Asn", @asn}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipam_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamId']")).not_nil!,
        asn: Core::XMLValue.string(node.xpath_node("*[local-name()='Asn']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @ipam_id, @asn)
  end
end
