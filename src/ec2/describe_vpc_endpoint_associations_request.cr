private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeVpcEndpointAssociationsRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The IDs of the VPC endpoints.
    property vpc_endpoint_ids : Array(String) | Nil

    # The filters.
    #
    # - `vpc-endpoint-id` - The ID of the VPC endpoint.
    #
    # - `associated-resource-accessibility` - The association state. When the state is `accessible`,
    # it returns `AVAILABLE`. When the state is `inaccessible`, it returns `PENDING` or `FAILED`.
    #
    # - `association-id` - The ID of the VPC endpoint association.
    #
    # - `associated-resource-id` - The ID of the associated resource configuration.
    #
    # - `service-network-arn` - The Amazon Resource Name (ARN) of the associated service network. Only
    # VPC endpoints of type service network will be returned.
    #
    # - `resource-configuration-group-arn` - The Amazon Resource Name (ARN) of the resource
    # configuration of type GROUP.
    property filters : Array(Filter) | Nil

    # The maximum page size.
    property max_results : Int32 | Nil

    # The pagination token.
    property next_token : String | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @vpc_endpoint_ids : Array(String) | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@vpc_endpoint_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}VpcEndpointId.#{i}", item}
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
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        vpc_endpoint_ids: node.xpath_nodes("*[local-name()='VpcEndpointId']/*[local-name()='item']").map { |n| n.content },
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 100") if value > 100
      end
    end

    def_equals_and_hash(@dry_run, @vpc_endpoint_ids, @filters, @max_results, @next_token)
  end
end
