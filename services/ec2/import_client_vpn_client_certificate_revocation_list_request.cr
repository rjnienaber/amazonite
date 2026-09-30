private alias Core = Amazonite::Core

module Amazonite::EC2
  class ImportClientVpnClientCertificateRevocationListRequest
    # The ID of the Client VPN endpoint to which the client certificate revocation list applies.
    property client_vpn_endpoint_id : String

    # The client certificate revocation list file. For more information, see [Generate a Client
    # Certificate Revocation
    # List](https://docs.aws.amazon.com/vpn/latest/clientvpn-admin/cvpn-working-certificates.html#cvpn-working-certificates-generate)
    # in the *Client VPN Administrator Guide*.
    property certificate_revocation_list : String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @client_vpn_endpoint_id : String,
      @certificate_revocation_list : String,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ClientVpnEndpointId", @client_vpn_endpoint_id}

      params << {"#{prefix}CertificateRevocationList", @certificate_revocation_list}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_vpn_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientVpnEndpointId']")).not_nil!,
        certificate_revocation_list: Core::XMLValue.string(node.xpath_node("*[local-name()='CertificateRevocationList']")).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@client_vpn_endpoint_id, @certificate_revocation_list, @dry_run)
  end
end
