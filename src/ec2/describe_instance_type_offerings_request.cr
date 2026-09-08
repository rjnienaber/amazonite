private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeInstanceTypeOfferingsRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The location type.
    #
    # - `availability-zone` - The Availability Zone. When you specify a location filter, it must be an
    # Availability Zone for the current Region.
    #
    # - `availability-zone-id` - The AZ ID. When you specify a location filter, it must be an AZ ID
    # for the current Region.
    #
    # - `outpost` - The Outpost ARN. When you specify a location filter, it must be an Outpost ARN for
    # the current Region.
    #
    # - `region` - The current Region. If you specify a location filter, it must match the current
    # Region.
    property location_type : LocationType | Nil

    # One or more filters. Filter names and values are case-sensitive.
    #
    # - `instance-type` - The instance type. For a list of possible values, see
    # [Instance](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_Instance.html).
    #
    # - `location` - The location. For a list of possible identifiers, see [Regions and
    # Zones](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html).
    property filters : Array(Filter) | Nil

    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    property max_results : Int32 | Nil

    # The token returned from a previous paginated request. Pagination continues from the end of the
    # items returned by the previous request.
    property next_token : String | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @location_type : LocationType | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @location_type
        params << {"#{prefix}LocationType", value.to_json_object_key}
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
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        location_type: (n = node.xpath_node("*[local-name()='LocationType']")) ? AEC::LocationType.from_json_object_key?(n.content) : nil,
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
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

    def_equals_and_hash(@dry_run, @location_type, @filters, @max_results, @next_token)
  end
end
