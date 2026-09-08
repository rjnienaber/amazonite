private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetVerifiedAccessEndpointPolicyRequest
    # The ID of the Verified Access endpoint.
    property verified_access_endpoint_id : String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @verified_access_endpoint_id : String,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}VerifiedAccessEndpointId", @verified_access_endpoint_id}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        verified_access_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VerifiedAccessEndpointId']")).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@verified_access_endpoint_id, @dry_run)
  end
end
