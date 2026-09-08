private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateIpamPrefixListResolverRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the IPAM that will serve as the source of the IP address database for CIDR selection.
    # The IPAM must be in the Advanced tier to use this feature.
    property ipam_id : String

    # A description for the IPAM prefix list resolver to help you identify its purpose and
    # configuration.
    property description : String | Nil

    # The address family for the IPAM prefix list resolver. Valid values are `ipv4` and `ipv6`. You
    # must create separate resolvers for IPv4 and IPv6 CIDRs as they cannot be mixed in the same
    # resolver.
    property address_family : AddressFamily

    # The CIDR selection rules for the resolver.
    #
    # CIDR selection rules define the business logic for selecting CIDRs from IPAM. If a CIDR matches
    # any of the rules, it will be included. If a rule has multiple conditions, the CIDR has to match
    # every condition of that rule. You can create a prefix list resolver without any CIDR selection
    # rules, but it will generate empty versions (containing no CIDRs) until you add rules.
    property rules : Array(IpamPrefixListResolverRuleRequest) | Nil

    # The tags to apply to the IPAM prefix list resolver during creation. Tags help you organize and
    # manage your Amazon Web Services resources.
    property tag_specifications : Array(TagSpecification) | Nil

    # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
    # For more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    def initialize(
      @ipam_id : String,
      @address_family : AddressFamily,
      @dry_run : Bool | Nil = nil,
      @description : String | Nil = nil,
      @rules : Array(IpamPrefixListResolverRuleRequest) | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @client_token : String | Nil = nil,
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

      params << {"#{prefix}AddressFamily", @address_family.to_json_object_key}

      (@rules || [] of IpamPrefixListResolverRuleRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Rule.#{i}."))
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipam_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamId']")).not_nil!,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        address_family: ((n = node.xpath_node("*[local-name()='AddressFamily']")) ? AEC::AddressFamily.from_json_object_key?(n.content) : nil).not_nil!,
        rules: node.xpath_nodes("*[local-name()='Rule']/*[local-name()='Rule']").map { |n| IpamPrefixListResolverRuleRequest.from_xml(n) },
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
      )
    end

    def validate! : Nil
      if value = @rules
        value.each(&.validate!)
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @ipam_id, @description, @address_family, @rules, @tag_specifications, @client_token)
  end
end
