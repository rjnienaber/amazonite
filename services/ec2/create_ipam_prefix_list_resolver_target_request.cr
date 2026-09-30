private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateIpamPrefixListResolverTargetRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the IPAM prefix list resolver that will manage the synchronization of CIDRs to the
    # target prefix list.
    property ipam_prefix_list_resolver_id : String

    # The ID of the managed prefix list that will be synchronized with CIDRs selected by the IPAM
    # prefix list resolver. This prefix list becomes an IPAM managed prefix list.
    #
    # An IPAM-managed prefix list is a customer-managed prefix list that has been associated with an
    # IPAM prefix list resolver target. When a prefix list becomes IPAM managed, its CIDRs are
    # automatically synchronized based on the IPAM prefix list resolver's CIDR selection rules, and
    # direct CIDR modifications are restricted.
    property prefix_list_id : String

    # The Amazon Web Services Region where the prefix list is located. This is required when
    # referencing a prefix list in a different Region.
    property prefix_list_region : String

    # The specific version of the prefix list to target. If not specified, the resolver will target
    # the latest version.
    property desired_version : Int64 | Nil

    # Indicates whether the resolver target should automatically track the latest version of the
    # prefix list. When enabled, the target will always synchronize with the most current version of
    # the prefix list.
    #
    # Choose this for automatic updates when you want your prefix lists to stay current with
    # infrastructure changes without manual intervention.
    property track_latest_version : Bool

    # The tags to apply to the IPAM prefix list resolver target during creation. Tags help you
    # organize and manage your Amazon Web Services resources.
    property tag_specifications : Array(TagSpecification) | Nil

    # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
    # For more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    def initialize(
      @ipam_prefix_list_resolver_id : String,
      @prefix_list_id : String,
      @prefix_list_region : String,
      @track_latest_version : Bool,
      @dry_run : Bool | Nil = nil,
      @desired_version : Int64 | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @client_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}IpamPrefixListResolverId", @ipam_prefix_list_resolver_id}

      params << {"#{prefix}PrefixListId", @prefix_list_id}

      params << {"#{prefix}PrefixListRegion", @prefix_list_region}

      if value = @desired_version
        params << {"#{prefix}DesiredVersion", value.to_s}
      end

      params << {"#{prefix}TrackLatestVersion", Core::QueryValue.bool(@track_latest_version)}

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
        ipam_prefix_list_resolver_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamPrefixListResolverId']")).not_nil!,
        prefix_list_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PrefixListId']")).not_nil!,
        prefix_list_region: Core::XMLValue.string(node.xpath_node("*[local-name()='PrefixListRegion']")).not_nil!,
        desired_version: Core::XMLValue.i64(node.xpath_node("*[local-name()='DesiredVersion']")),
        track_latest_version: Core::XMLValue.bool(node.xpath_node("*[local-name()='TrackLatestVersion']")).not_nil!,
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @ipam_prefix_list_resolver_id, @prefix_list_id, @prefix_list_region, @desired_version, @track_latest_version, @tag_specifications, @client_token)
  end
end
