private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeTransitGatewayPeeringAttachmentsRequest
    # One or more IDs of the transit gateway peering attachments.
    property transit_gateway_attachment_ids : Array(String) | Nil

    # One or more filters. The possible values are:
    #
    # - `transit-gateway-attachment-id` - The ID of the transit gateway attachment.
    #
    # - `local-owner-id` - The ID of your Amazon Web Services account.
    #
    # - `remote-owner-id` - The ID of the Amazon Web Services account in the remote Region that owns
    # the transit gateway.
    #
    # - `state` - The state of the peering attachment. Valid values are `available` | `deleted` |
    # `deleting` | `failed` | `failing` | `initiatingRequest` | `modifying` | `pendingAcceptance` |
    # `pending` | `rollingBack` | `rejected` | `rejecting`).
    #
    # - `tag`: - The key/value combination of a tag assigned to the resource. Use the tag key in the
    # filter name and the tag value as the filter value. For example, to find all resources that have
    # a tag with the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and
    # `TeamA` for the filter value.
    #
    # - `tag-key` - The key of a tag assigned to the resource. Use this filter to find all resources
    # that have a tag with a specific key, regardless of the tag value.
    #
    # - `transit-gateway-id` - The ID of the transit gateway.
    property filters : Array(Filter) | Nil

    # The maximum number of results to return with a single call. To retrieve the remaining results,
    # make another call with the returned `nextToken` value.
    property max_results : Int32 | Nil

    # The token for the next page of results.
    property next_token : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @transit_gateway_attachment_ids : Array(String) | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@transit_gateway_attachment_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}TransitGatewayAttachmentIds.#{i}", item}
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

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_attachment_ids: node.xpath_nodes("*[local-name()='TransitGatewayAttachmentIds']/*[local-name()='item']").map { |n| n.content },
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
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

    def_equals_and_hash(@transit_gateway_attachment_ids, @filters, @max_results, @next_token, @dry_run)
  end
end
