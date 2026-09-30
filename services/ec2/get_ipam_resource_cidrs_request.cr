private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetIpamResourceCidrsRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # One or more filters for the request. For more information about filtering, see [Filtering CLI
    # output](https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-filter.html).
    property filters : Array(Filter) | Nil

    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    property max_results : Int32 | Nil

    # The token for the next page of results.
    property next_token : String | Nil

    # The ID of the scope that the resource is in.
    property ipam_scope_id : String

    # The ID of the IPAM pool that the resource is in.
    property ipam_pool_id : String | Nil

    # The ID of the resource.
    property resource_id : String | Nil

    # The resource type.
    property resource_type : IpamResourceType | Nil

    # The resource tag.
    property resource_tag : RequestIpamResourceTag | Nil

    # The ID of the Amazon Web Services account that owns the resource.
    property resource_owner : String | Nil

    def initialize(
      @ipam_scope_id : String,
      @dry_run : Bool | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @ipam_pool_id : String | Nil = nil,
      @resource_id : String | Nil = nil,
      @resource_type : IpamResourceType | Nil = nil,
      @resource_tag : RequestIpamResourceTag | Nil = nil,
      @resource_owner : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      params << {"#{prefix}IpamScopeId", @ipam_scope_id}

      if value = @ipam_pool_id
        params << {"#{prefix}IpamPoolId", value}
      end

      if value = @resource_id
        params << {"#{prefix}ResourceId", value}
      end

      if value = @resource_type
        params << {"#{prefix}ResourceType", value.to_json_object_key}
      end

      if value = @resource_tag
        params.concat(value.to_query_params("#{prefix}ResourceTag."))
      end

      if value = @resource_owner
        params << {"#{prefix}ResourceOwner", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        ipam_scope_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamScopeId']")).not_nil!,
        ipam_pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamPoolId']")),
        resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceId']")),
        resource_type: (n = node.xpath_node("*[local-name()='ResourceType']")) ? AEC::IpamResourceType.from_json_object_key?(n.content) : nil,
        resource_tag: node.xpath_node("*[local-name()='ResourceTag']").try { |n| RequestIpamResourceTag.from_xml(n) },
        resource_owner: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceOwner']")),
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 5") if value < 5
        raise Core::ValidationError.new("MaxResults value must be <= 1000") if value > 1000
      end

      if value = @resource_tag
        value.validate!
      end
    end

    def_equals_and_hash(@dry_run, @filters, @max_results, @next_token, @ipam_scope_id, @ipam_pool_id, @resource_id, @resource_type, @resource_tag, @resource_owner)
  end
end
