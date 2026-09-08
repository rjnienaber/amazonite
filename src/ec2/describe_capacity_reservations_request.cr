private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeCapacityReservationsRequest
    # The ID of the Capacity Reservation.
    property capacity_reservation_ids : Array(String) | Nil

    # The token to use to retrieve the next page of results.
    property next_token : String | Nil

    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    property max_results : Int32 | Nil

    # One or more filters.
    #
    # - `instance-type` - The type of instance for which the Capacity Reservation reserves capacity.
    #
    # - `owner-id` - The ID of the Amazon Web Services account that owns the Capacity Reservation.
    #
    # - `instance-platform` - The type of operating system for which the Capacity Reservation reserves
    # capacity.
    #
    # - `availability-zone` - The Availability Zone of the Capacity Reservation.
    #
    # - `tenancy` - Indicates the tenancy of the Capacity Reservation. A Capacity Reservation can have
    # one of the following tenancy settings:
    #
    # - `default` - The Capacity Reservation is created on hardware that is shared with other Amazon
    # Web Services accounts.
    #
    # - `dedicated` - The Capacity Reservation is created on single-tenant hardware that is dedicated
    # to a single Amazon Web Services account.
    #
    # - `outpost-arn` - The Amazon Resource Name (ARN) of the Outpost on which the Capacity
    # Reservation was created.
    #
    # - `state` - The current state of the Capacity Reservation. A Capacity Reservation can be in one
    # of the following states:
    #
    # - `active`- The Capacity Reservation is active and the capacity is available for your use.
    #
    # - `expired` - The Capacity Reservation expired automatically at the date and time specified in
    # your request. The reserved capacity is no longer available for your use.
    #
    # - `cancelled` - The Capacity Reservation was cancelled. The reserved capacity is no longer
    # available for your use.
    #
    # - `pending` - The Capacity Reservation request was successful but the capacity provisioning is
    # still pending.
    #
    # - `failed` - The Capacity Reservation request has failed. A request might fail due to invalid
    # request parameters, capacity constraints, or instance limit constraints. Failed requests are
    # retained for 60 minutes.
    #
    # - `start-date` - The date and time at which the Capacity Reservation was started.
    #
    # - `end-date` - The date and time at which the Capacity Reservation expires. When a Capacity
    # Reservation expires, the reserved capacity is released and you can no longer launch instances
    # into it. The Capacity Reservation's state changes to expired when it reaches its end date and
    # time.
    #
    # - `end-date-type` - Indicates the way in which the Capacity Reservation ends. A Capacity
    # Reservation can have one of the following end types:
    #
    # - `unlimited` - The Capacity Reservation remains active until you explicitly cancel it.
    #
    # - `limited` - The Capacity Reservation expires automatically at a specified date and time.
    #
    # - `instance-match-criteria` - Indicates the type of instance launches that the Capacity
    # Reservation accepts. The options include:
    #
    # - `open` - The Capacity Reservation accepts all instances that have matching attributes
    # (instance type, platform, and Availability Zone). Instances that have matching attributes launch
    # into the Capacity Reservation automatically without specifying any additional parameters.
    #
    # - `targeted` - The Capacity Reservation only accepts instances that have matching attributes
    # (instance type, platform, and Availability Zone), and explicitly target the Capacity
    # Reservation. This ensures that only permitted instances can use the reserved capacity.
    #
    # - `placement-group-arn` - The ARN of the cluster placement group in which the Capacity
    # Reservation was created.
    property filters : Array(Filter) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
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

    def_equals_and_hash(@capacity_reservation_ids, @next_token, @max_results, @filters, @dry_run)
  end
end
