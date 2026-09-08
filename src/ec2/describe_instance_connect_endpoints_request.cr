private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeInstanceConnectEndpointsRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    property max_results : Int32 | Nil

    # The token returned from a previous paginated request. Pagination continues from the end of the
    # items returned by the previous request.
    property next_token : String | Nil

    # One or more filters.
    #
    # - `instance-connect-endpoint-id` - The ID of the EC2 Instance Connect Endpoint.
    #
    # - `state` - The state of the EC2 Instance Connect Endpoint (`create-in-progress` |
    # `create-complete` | `create-failed` | `delete-in-progress` | `delete-complete` |
    # `delete-failed`).
    #
    # - `subnet-id` - The ID of the subnet in which the EC2 Instance Connect Endpoint was created.
    #
    # - `tag`: - The key/value combination of a tag assigned to the resource. Use the tag key in the
    # filter name and the tag value as the filter value. For example, to find all resources that have
    # a tag with the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and
    # `TeamA` for the filter value.
    #
    # - `tag-key` - The key of a tag assigned to the resource. Use this filter to find all resources
    # assigned a tag with a specific key, regardless of the tag value.
    #
    # - `tag-value` - The value of a tag assigned to the resource. Use this filter to find all
    # resources that have a tag with a specific value, regardless of tag key.
    #
    # - `vpc-id` - The ID of the VPC in which the EC2 Instance Connect Endpoint was created.
    property filters : Array(Filter) | Nil

    # One or more EC2 Instance Connect Endpoint IDs.
    property instance_connect_endpoint_ids : Array(String) | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @instance_connect_endpoint_ids : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      (@instance_connect_endpoint_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}InstanceConnectEndpointId.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        instance_connect_endpoint_ids: node.xpath_nodes("*[local-name()='InstanceConnectEndpointId']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 50") if value > 50
      end

      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @max_results, @next_token, @filters, @instance_connect_endpoint_ids)
  end
end
