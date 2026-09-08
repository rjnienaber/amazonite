private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateVerifiedAccessInstanceRequest
    # A description for the Verified Access instance.
    property description : String | Nil

    # The tags to assign to the Verified Access instance.
    property tag_specifications : Array(TagSpecification) | Nil

    # A unique, case-sensitive token that you provide to ensure idempotency of your modification
    # request. For more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Enable or disable support for Federal Information Processing Standards (FIPS) on the instance.
    property fips_enabled : Bool | Nil

    # The custom subdomain.
    property cidr_endpoints_custom_sub_domain : String | Nil

    def initialize(
      @description : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @client_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @fips_enabled : Bool | Nil = nil,
      @cidr_endpoints_custom_sub_domain : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @fips_enabled
        params << {"#{prefix}FIPSEnabled", Core::QueryValue.bool(value)}
      end

      if value = @cidr_endpoints_custom_sub_domain
        params << {"#{prefix}CidrEndpointsCustomSubDomain", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        fips_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='FIPSEnabled']")),
        cidr_endpoints_custom_sub_domain: Core::XMLValue.string(node.xpath_node("*[local-name()='CidrEndpointsCustomSubDomain']")),
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@description, @tag_specifications, @client_token, @dry_run, @fips_enabled, @cidr_endpoints_custom_sub_domain)
  end
end
