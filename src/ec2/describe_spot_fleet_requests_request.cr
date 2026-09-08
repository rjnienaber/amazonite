private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for DescribeSpotFleetRequests.
  class DescribeSpotFleetRequestsRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The IDs of the Spot Fleet requests.
    property spot_fleet_request_ids : Array(String) | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    property max_results : Int32 | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @spot_fleet_request_ids : Array(String) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@spot_fleet_request_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SpotFleetRequestId.#{i}", item}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        spot_fleet_request_ids: node.xpath_nodes("*[local-name()='spotFleetRequestId']/*[local-name()='item']").map { |n| n.content },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='maxResults']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @spot_fleet_request_ids, @next_token, @max_results)
  end
end
