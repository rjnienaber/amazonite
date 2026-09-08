private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeCapacityReservationTopologyRequest
    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The token returned from a previous paginated request. Pagination continues from the end of the
    # items returned by the previous request.
    property next_token : String | Nil

    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    #
    # You can't specify this parameter and the Capacity Reservation IDs parameter in the same request.
    #
    # Default: `10`
    property max_results : Int32 | Nil

    # The Capacity Reservation IDs.
    #
    # Default: Describes all your Capacity Reservations.
    #
    # Constraints: Maximum 10 explicitly specified Capacity Reservation IDs.
    property capacity_reservation_ids : Array(String) | Nil

    # The filters.
    #
    # - `availability-zone` - The name of the Availability Zone (for example, `us-west-2a`) or Local
    # Zone (for example, `us-west-2-lax-1b`) that the Capacity Reservation is in.
    #
    # - `instance-type` - The instance type (for example, `p4d.24xlarge`) or instance family (for
    # example, `p4d*`). You can use the `*` wildcard to match zero or more characters, or the `?`
    # wildcard to match zero or one character.
    property filters : Array(Filter) | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @capacity_reservation_ids : Array(String) | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      (@capacity_reservation_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}CapacityReservationId.#{i}", item}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        capacity_reservation_ids: node.xpath_nodes("*[local-name()='CapacityReservationId']/*[local-name()='item']").map { |n| n.content },
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 10") if value > 10
      end

      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @next_token, @max_results, @capacity_reservation_ids, @filters)
  end
end
