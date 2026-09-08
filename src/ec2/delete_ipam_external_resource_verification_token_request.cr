private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteIpamExternalResourceVerificationTokenRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The token ID.
    property ipam_external_resource_verification_token_id : String

    def initialize(
      @ipam_external_resource_verification_token_id : String,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}IpamExternalResourceVerificationTokenId", @ipam_external_resource_verification_token_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipam_external_resource_verification_token_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamExternalResourceVerificationTokenId']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @ipam_external_resource_verification_token_id)
  end
end
