private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeCapacityBlockExtensionOfferingsRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The duration of the Capacity Block extension offering in hours.
    property capacity_block_extension_duration_hours : Int32

    # The ID of the Capacity reservation to be extended.
    property capacity_reservation_id : String

    # The token to use to retrieve the next page of results.
    property next_token : String | Nil

    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    property max_results : Int32 | Nil

    def initialize(
      @capacity_block_extension_duration_hours : Int32,
      @capacity_reservation_id : String,
      @dry_run : Bool | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}CapacityBlockExtensionDurationHours", @capacity_block_extension_duration_hours.to_s}

      params << {"#{prefix}CapacityReservationId", @capacity_reservation_id}

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
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        capacity_block_extension_duration_hours: Core::XMLValue.i32(node.xpath_node("*[local-name()='CapacityBlockExtensionDurationHours']")).not_nil!,
        capacity_reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='CapacityReservationId']")).not_nil!,
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
      )
    end

    def validate! : Nil
      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 1000") if value > 1000
      end
    end

    def_equals_and_hash(@dry_run, @capacity_block_extension_duration_hours, @capacity_reservation_id, @next_token, @max_results)
  end
end
