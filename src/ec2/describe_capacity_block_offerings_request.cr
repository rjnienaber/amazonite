private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeCapacityBlockOfferingsRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The type of instance for which the Capacity Block offering reserves capacity.
    property instance_type : String | Nil

    # The number of instances for which to reserve capacity. Each Capacity Block can have up to 64
    # instances, and you can have up to 256 instances across Capacity Blocks.
    property instance_count : Int32 | Nil

    # The earliest start date for the Capacity Block offering.
    property start_date_range : Time | Nil

    # The latest end date for the Capacity Block offering.
    property end_date_range : Time | Nil

    # The reservation duration for the Capacity Block, in hours. You must specify the duration in
    # 1-day increments up 14 days, and in 7-day increments up to 182 days.
    property capacity_duration_hours : Int32

    # The token to use to retrieve the next page of results.
    property next_token : String | Nil

    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    property max_results : Int32 | Nil

    # The EC2 UltraServer type of the Capacity Block offerings.
    property ultraserver_type : String | Nil

    # The number of EC2 UltraServers in the offerings.
    property ultraserver_count : Int32 | Nil

    # Include all Availability Zones and Local Zones, regardless of your opt-in status. If you do not
    # use this parameter, the results include available offerings from all Availability Zones in the
    # Amazon Web Services Region and Local Zones you are opted into.
    property all_availability_zones : Bool | Nil

    def initialize(
      @capacity_duration_hours : Int32,
      @dry_run : Bool | Nil = nil,
      @instance_type : String | Nil = nil,
      @instance_count : Int32 | Nil = nil,
      @start_date_range : Time | Nil = nil,
      @end_date_range : Time | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @ultraserver_type : String | Nil = nil,
      @ultraserver_count : Int32 | Nil = nil,
      @all_availability_zones : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @instance_type
        params << {"#{prefix}InstanceType", value}
      end

      if value = @instance_count
        params << {"#{prefix}InstanceCount", value.to_s}
      end

      if value = @start_date_range
        params << {"#{prefix}StartDateRange", Core::QueryValue.time(value)}
      end

      if value = @end_date_range
        params << {"#{prefix}EndDateRange", Core::QueryValue.time(value)}
      end

      params << {"#{prefix}CapacityDurationHours", @capacity_duration_hours.to_s}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @ultraserver_type
        params << {"#{prefix}UltraserverType", value}
      end

      if value = @ultraserver_count
        params << {"#{prefix}UltraserverCount", value.to_s}
      end

      if value = @all_availability_zones
        params << {"#{prefix}AllAvailabilityZones", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        instance_type: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceType']")),
        instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='InstanceCount']")),
        start_date_range: Core::XMLValue.time(node.xpath_node("*[local-name()='StartDateRange']")),
        end_date_range: Core::XMLValue.time(node.xpath_node("*[local-name()='EndDateRange']")),
        capacity_duration_hours: Core::XMLValue.i32(node.xpath_node("*[local-name()='CapacityDurationHours']")).not_nil!,
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        ultraserver_type: Core::XMLValue.string(node.xpath_node("*[local-name()='UltraserverType']")),
        ultraserver_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='UltraserverCount']")),
        all_availability_zones: Core::XMLValue.bool(node.xpath_node("*[local-name()='AllAvailabilityZones']")),
      )
    end

    def validate! : Nil
      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 1000") if value > 1000
      end
    end

    def_equals_and_hash(@dry_run, @instance_type, @instance_count, @start_date_range, @end_date_range, @capacity_duration_hours, @next_token, @max_results, @ultraserver_type, @ultraserver_count, @all_availability_zones)
  end
end
