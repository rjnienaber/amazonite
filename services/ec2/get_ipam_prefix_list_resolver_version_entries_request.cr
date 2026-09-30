private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetIpamPrefixListResolverVersionEntriesRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the IPAM prefix list resolver whose version entries you want to retrieve.
    property ipam_prefix_list_resolver_id : String

    # The version number of the resolver for which to retrieve CIDR entries. If not specified, the
    # latest version is used.
    property ipam_prefix_list_resolver_version : Int64

    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    property max_results : Int32 | Nil

    # The token for the next page of results.
    property next_token : String | Nil

    def initialize(
      @ipam_prefix_list_resolver_id : String,
      @ipam_prefix_list_resolver_version : Int64,
      @dry_run : Bool | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}IpamPrefixListResolverId", @ipam_prefix_list_resolver_id}

      params << {"#{prefix}IpamPrefixListResolverVersion", @ipam_prefix_list_resolver_version.to_s}

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipam_prefix_list_resolver_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamPrefixListResolverId']")).not_nil!,
        ipam_prefix_list_resolver_version: Core::XMLValue.i64(node.xpath_node("*[local-name()='IpamPrefixListResolverVersion']")).not_nil!,
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def validate! : Nil
      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 5") if value < 5
        raise Core::ValidationError.new("MaxResults value must be <= 1000") if value > 1000
      end
    end

    def_equals_and_hash(@dry_run, @ipam_prefix_list_resolver_id, @ipam_prefix_list_resolver_version, @max_results, @next_token)
  end
end
