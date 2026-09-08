private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for DescribeSpotPriceHistory.
  class DescribeSpotPriceHistoryRequest
    # Filters the results by the specified ID of the Availability Zone.
    #
    # Either `AvailabilityZone` or `AvailabilityZoneId` can be specified, but not both
    property availability_zone_id : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The date and time, up to the past 90 days, from which to start retrieving the price history
    # data, in UTC format (for example, *YYYY*-*MM*-*DD*T*HH*:*MM*:*SS*Z).
    property start_time : Time | Nil

    # The date and time, up to the current date, from which to stop retrieving the price history data,
    # in UTC format (for example, *YYYY*-*MM*-*DD*T*HH*:*MM*:*SS*Z).
    property end_time : Time | Nil

    # Filters the results by the specified instance types.
    property instance_types : Array(InstanceType) | Nil

    # Filters the results by the specified basic product descriptions.
    property product_descriptions : Array(String) | Nil

    # The filters.
    #
    # - `availability-zone` - The Availability Zone for which prices should be returned.
    #
    # - `availability-zone-id` - The ID of the Availability Zone for which prices should be returned.
    #
    # - `instance-type` - The type of instance (for example, `m3.medium`).
    #
    # - `product-description` - The product description for the Spot price (`Linux/UNIX` | `Red Hat
    # Enterprise Linux` | `SUSE Linux` | `Windows` | `Linux/UNIX (Amazon VPC)` | `Red Hat Enterprise
    # Linux (Amazon VPC)` | `SUSE Linux (Amazon VPC)` | `Windows (Amazon VPC)`).
    #
    # - `spot-price` - The Spot price. The value must match exactly (or use wildcards; greater than or
    # less than comparison is not supported).
    #
    # - `timestamp` - The time stamp of the Spot price history, in UTC format (for example, *ddd MMM
    # dd HH*:*mm*:*ss* UTC *YYYY*). You can use wildcards (`*` and `?`). Greater than or less than
    # comparison is not supported.
    property filters : Array(Filter) | Nil

    # Filters the results by the specified Availability Zone.
    #
    # Either `AvailabilityZone` or `AvailabilityZoneId` can be specified, but not both
    property availability_zone : String | Nil

    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    property max_results : Int32 | Nil

    # The token returned from a previous paginated request. Pagination continues from the end of the
    # items returned by the previous request.
    property next_token : String | Nil

    def initialize(
      @availability_zone_id : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @start_time : Time | Nil = nil,
      @end_time : Time | Nil = nil,
      @instance_types : Array(InstanceType) | Nil = nil,
      @product_descriptions : Array(String) | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @availability_zone : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @start_time
        params << {"#{prefix}StartTime", Core::QueryValue.time(value)}
      end

      if value = @end_time
        params << {"#{prefix}EndTime", Core::QueryValue.time(value)}
      end

      (@instance_types || [] of InstanceType).each_with_index(1) do |item, i|
        params << {"#{prefix}InstanceType.#{i}", item.to_json_object_key}
      end

      (@product_descriptions || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ProductDescription.#{i}", item}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
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
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AvailabilityZoneId']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        start_time: Core::XMLValue.time(node.xpath_node("*[local-name()='startTime']")),
        end_time: Core::XMLValue.time(node.xpath_node("*[local-name()='endTime']")),
        instance_types: node.xpath_nodes("*[local-name()='InstanceType']/*[local-name()='item']").compact_map { |n| AEC::InstanceType.from_json_object_key?(n.content) },
        product_descriptions: node.xpath_nodes("*[local-name()='ProductDescription']/*[local-name()='item']").map { |n| n.content },
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='maxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@availability_zone_id, @dry_run, @start_time, @end_time, @instance_types, @product_descriptions, @filters, @availability_zone, @max_results, @next_token)
  end
end
