private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateIpamScopeRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the IPAM for which you're creating this scope.
    property ipam_id : String

    # A description for the scope you're creating.
    property description : String | Nil

    # The key/value combination of a tag assigned to the resource. Use the tag key in the filter name
    # and the tag value as the filter value. For example, to find all resources that have a tag with
    # the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and `TeamA` for
    # the filter value.
    property tag_specifications : Array(TagSpecification) | Nil

    # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
    # For more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    # The configuration that links an Amazon VPC IPAM scope to an external authority system. It
    # specifies the type of external system and the external resource identifier that identifies your
    # account or instance in that system.
    #
    # In IPAM, an external authority is a third-party IP address management system that provides CIDR
    # blocks when you provision address space for top-level IPAM pools. This allows you to use your
    # existing IP management system to control which address ranges are allocated to Amazon Web
    # Services while using Amazon VPC IPAM to manage subnets within those ranges.
    property external_authority_configuration : ExternalAuthorityConfiguration | Nil

    def initialize(
      @ipam_id : String,
      @dry_run : Bool | Nil = nil,
      @description : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @client_token : String | Nil = nil,
      @external_authority_configuration : ExternalAuthorityConfiguration | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}IpamId", @ipam_id}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @external_authority_configuration
        params.concat(value.to_query_params("#{prefix}ExternalAuthorityConfiguration."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipam_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamId']")).not_nil!,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        external_authority_configuration: node.xpath_node("*[local-name()='ExternalAuthorityConfiguration']").try { |n| ExternalAuthorityConfiguration.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end

      if value = @external_authority_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@dry_run, @ipam_id, @description, @tag_specifications, @client_token, @external_authority_configuration)
  end
end
