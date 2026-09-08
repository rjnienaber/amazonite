private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeFleetsRequest
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

    # The IDs of the EC2 Fleets.
    #
    # If a fleet is of type `instant`, you must specify the fleet ID, otherwise it does not appear in
    # the response.
    property fleet_ids : Array(String) | Nil

    # The filters.
    #
    # - `activity-status` - The progress of the EC2 Fleet ( `error` | `pending-fulfillment` |
    # `pending-termination` | `fulfilled`).
    #
    # - `excess-capacity-termination-policy` - Indicates whether to terminate running instances if the
    # target capacity is decreased below the current EC2 Fleet size (`true` | `false`).
    #
    # - `fleet-state` - The state of the EC2 Fleet (`submitted` | `active` | `deleted` | `failed` |
    # `deleted-running` | `deleted-terminating` | `modifying`).
    #
    # - `replace-unhealthy-instances` - Indicates whether EC2 Fleet should replace unhealthy instances
    # (`true` | `false`).
    #
    # - `type` - The type of request (`instant` | `request` | `maintain`).
    property filters : Array(Filter) | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @fleet_ids : Array(String) | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
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

      (@fleet_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}FleetId.#{i}", item}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        fleet_ids: node.xpath_nodes("*[local-name()='FleetId']/*[local-name()='item']").map { |n| n.content },
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @max_results, @next_token, @fleet_ids, @filters)
  end
end
