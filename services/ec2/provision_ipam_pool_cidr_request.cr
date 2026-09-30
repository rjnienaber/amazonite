private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ProvisionIpamPoolCidrRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the IPAM pool to which you want to assign a CIDR.
    property ipam_pool_id : String

    # The CIDR you want to assign to the IPAM pool. Either "NetmaskLength" or "Cidr" is required. This
    # value will be null if you specify "NetmaskLength" and will be filled in during the provisioning
    # process.
    property cidr : String | Nil

    # A signed document that proves that you are authorized to bring a specified IP address range to
    # Amazon using BYOIP. This option only applies to IPv4 and IPv6 pools in the public scope.
    property cidr_authorization_context : IpamCidrAuthorizationContext | Nil

    # The netmask length of the CIDR you'd like to provision to a pool. Can be used for provisioning
    # Amazon-provided IPv6 CIDRs to top-level pools and for provisioning CIDRs to pools with source
    # pools. Cannot be used to provision BYOIP CIDRs to top-level pools. Either "NetmaskLength" or
    # "Cidr" is required.
    property netmask_length : Int32 | Nil

    # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
    # For more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    # The method for verifying control of a public IP address range. Defaults to `remarks-x509` if not
    # specified. This option only applies to IPv4 and IPv6 pools in the public scope.
    property verification_method : VerificationMethod | Nil

    # Verification token ID. This option only applies to IPv4 and IPv6 pools in the public scope.
    property ipam_external_resource_verification_token_id : String | Nil

    def initialize(
      @ipam_pool_id : String,
      @dry_run : Bool | Nil = nil,
      @cidr : String | Nil = nil,
      @cidr_authorization_context : IpamCidrAuthorizationContext | Nil = nil,
      @netmask_length : Int32 | Nil = nil,
      @client_token : String | Nil = nil,
      @verification_method : VerificationMethod | Nil = nil,
      @ipam_external_resource_verification_token_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}IpamPoolId", @ipam_pool_id}

      if value = @cidr
        params << {"#{prefix}Cidr", value}
      end

      if value = @cidr_authorization_context
        params.concat(value.to_query_params("#{prefix}CidrAuthorizationContext."))
      end

      if value = @netmask_length
        params << {"#{prefix}NetmaskLength", value.to_s}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @verification_method
        params << {"#{prefix}VerificationMethod", value.to_json_object_key}
      end

      if value = @ipam_external_resource_verification_token_id
        params << {"#{prefix}IpamExternalResourceVerificationTokenId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipam_pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamPoolId']")).not_nil!,
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='Cidr']")),
        cidr_authorization_context: node.xpath_node("*[local-name()='CidrAuthorizationContext']").try { |n| IpamCidrAuthorizationContext.from_xml(n) },
        netmask_length: Core::XMLValue.i32(node.xpath_node("*[local-name()='NetmaskLength']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        verification_method: (n = node.xpath_node("*[local-name()='VerificationMethod']")) ? AEC::VerificationMethod.from_json_object_key?(n.content) : nil,
        ipam_external_resource_verification_token_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamExternalResourceVerificationTokenId']")),
      )
    end

    def validate! : Nil
      if value = @cidr_authorization_context
        value.validate!
      end
    end

    def_equals_and_hash(@dry_run, @ipam_pool_id, @cidr, @cidr_authorization_context, @netmask_length, @client_token, @verification_method, @ipam_external_resource_verification_token_id)
  end
end
