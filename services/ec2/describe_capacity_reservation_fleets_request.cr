private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeCapacityReservationFleetsRequest
    # The IDs of the Capacity Reservation Fleets to describe.
    property capacity_reservation_fleet_ids : Array(String) | Nil

    # The token to use to retrieve the next page of results.
    property next_token : String | Nil

    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    property max_results : Int32 | Nil

    # One or more filters.
    #
    # - `state` - The state of the Fleet (`submitted` | `modifying` | `active` | `partially_fulfilled`
    # | `expiring` | `expired` | `cancelling` | `cancelled` | `failed`).
    #
    # - `instance-match-criteria` - The instance matching criteria for the Fleet. Only `open` is
    # supported.
    #
    # - `tenancy` - The tenancy of the Fleet (`default` | `dedicated`).
    #
    # - `allocation-strategy` - The allocation strategy used by the Fleet. Only `prioritized` is
    # supported.
    property filters : Array(Filter) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @capacity_reservation_fleet_ids : Array(String) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@capacity_reservation_fleet_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}CapacityReservationFleetId.#{i}", item}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_reservation_fleet_ids: node.xpath_nodes("*[local-name()='CapacityReservationFleetId']/*[local-name()='item']").map { |n| n.content },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 100") if value > 100
      end

      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@capacity_reservation_fleet_ids, @next_token, @max_results, @filters, @dry_run)
  end
end
