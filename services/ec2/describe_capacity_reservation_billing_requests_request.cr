private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeCapacityReservationBillingRequestsRequest
    # The ID of the Capacity Reservation.
    property capacity_reservation_ids : Array(String) | Nil

    # Specify one of the following:
    #
    # - `odcr-owner` - If you are the Capacity Reservation owner, specify this value to view requests
    # that you have initiated. Not supported with the `requested-by` filter.
    #
    # - `unused-reservation-billing-owner` - If you are the consumer account, specify this value to
    # view requests that have been sent to you. Not supported with the
    # `unused-reservation-billing-owner` filter.
    property role : CallerRole

    # The token to use to retrieve the next page of results.
    property next_token : String | Nil

    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    property max_results : Int32 | Nil

    # One or more filters.
    #
    # - `status` - The state of the request (`pending` | `accepted` | `rejected` | `cancelled` |
    # `revoked` | `expired`).
    #
    # - `requested-by` - The account ID of the Capacity Reservation owner that initiated the request.
    # Not supported if you specify `requested-by` for **Role**.
    #
    # - `unused-reservation-billing-owner` - The ID of the consumer account to which the request was
    # sent. Not supported if you specify `unused-reservation-billing-owner` for **Role**.
    property filters : Array(Filter) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @role : CallerRole,
      @capacity_reservation_ids : Array(String) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@capacity_reservation_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}CapacityReservationId.#{i}", item}
      end

      params << {"#{prefix}Role", @role.to_json_object_key}

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
        capacity_reservation_ids: node.xpath_nodes("*[local-name()='CapacityReservationId']/*[local-name()='item']").map { |n| n.content },
        role: ((n = node.xpath_node("*[local-name()='Role']")) ? AEC::CallerRole.from_json_object_key?(n.content) : nil).not_nil!,
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 1000") if value > 1000
      end

      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@capacity_reservation_ids, @role, @next_token, @max_results, @filters, @dry_run)
  end
end
