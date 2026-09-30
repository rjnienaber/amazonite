private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetIpamPolicyAllocationRulesRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the IPAM policy for which to get allocation rules.
    property ipam_policy_id : String

    # One or more filters for the allocation rules.
    property filters : Array(Filter) | Nil

    # The locale for which to get the allocation rules.
    property locale : String | Nil

    # The resource type for which to get the allocation rules.
    #
    # The Amazon Web Services service or resource type that can use IP addresses through IPAM
    # policies. Supported services and resource types include:
    #
    # - Elastic IP addresses
    property resource_type : IpamPolicyResourceType | Nil

    # The maximum number of results to return in a single call.
    property max_results : Int32 | Nil

    # The token for the next page of results.
    property next_token : String | Nil

    def initialize(
      @ipam_policy_id : String,
      @dry_run : Bool | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @locale : String | Nil = nil,
      @resource_type : IpamPolicyResourceType | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}IpamPolicyId", @ipam_policy_id}

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      if value = @locale
        params << {"#{prefix}Locale", value}
      end

      if value = @resource_type
        params << {"#{prefix}ResourceType", value.to_json_object_key}
      end

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
        ipam_policy_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamPolicyId']")).not_nil!,
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        locale: Core::XMLValue.string(node.xpath_node("*[local-name()='Locale']")),
        resource_type: (n = node.xpath_node("*[local-name()='ResourceType']")) ? AEC::IpamPolicyResourceType.from_json_object_key?(n.content) : nil,
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
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
    end

    def_equals_and_hash(@dry_run, @ipam_policy_id, @filters, @locale, @resource_type, @max_results, @next_token)
  end
end
