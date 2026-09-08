private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyVerifiedAccessInstanceRequest
    # The ID of the Verified Access instance.
    property verified_access_instance_id : String

    # A description for the Verified Access instance.
    property description : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # A unique, case-sensitive token that you provide to ensure idempotency of your modification
    # request. For more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    # The custom subdomain.
    property cidr_endpoints_custom_sub_domain : String | Nil

    def initialize(
      @verified_access_instance_id : String,
      @description : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @client_token : String | Nil = nil,
      @cidr_endpoints_custom_sub_domain : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}VerifiedAccessInstanceId", @verified_access_instance_id}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @cidr_endpoints_custom_sub_domain
        params << {"#{prefix}CidrEndpointsCustomSubDomain", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        verified_access_instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VerifiedAccessInstanceId']")).not_nil!,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        cidr_endpoints_custom_sub_domain: Core::XMLValue.string(node.xpath_node("*[local-name()='CidrEndpointsCustomSubDomain']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@verified_access_instance_id, @description, @dry_run, @client_token, @cidr_endpoints_custom_sub_domain)
  end
end
