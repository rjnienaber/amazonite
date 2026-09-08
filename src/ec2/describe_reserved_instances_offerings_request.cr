private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for DescribeReservedInstancesOfferings.
  class DescribeReservedInstancesOfferingsRequest
    # The Availability Zone in which the Reserved Instance can be used.
    #
    # Either `AvailabilityZone` or `AvailabilityZoneId` can be specified, but not both.
    property availability_zone : String | Nil

    # Include Reserved Instance Marketplace offerings in the response.
    property include_marketplace : Bool | Nil

    # The instance type that the reservation will cover (for example, `m1.small`). For more
    # information, see [Amazon EC2 instance
    # types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html) in the *Amazon
    # EC2 User Guide*.
    property instance_type : InstanceType | Nil

    # The maximum duration (in seconds) to filter when searching for offerings.
    #
    # Default: 94608000 (3 years)
    property max_duration : Int64 | Nil

    # The maximum number of instances to filter when searching for offerings.
    #
    # Default: 20
    property max_instance_count : Int32 | Nil

    # The minimum duration (in seconds) to filter when searching for offerings.
    #
    # Default: 2592000 (1 month)
    property min_duration : Int64 | Nil

    # The offering class of the Reserved Instance. Can be `standard` or `convertible`.
    property offering_class : OfferingClassType | Nil

    # The Reserved Instance product platform description. Instances that include `(Amazon VPC)` in the
    # description are for use with Amazon VPC.
    property product_description : RIProductDescription | Nil

    # One or more Reserved Instances offering IDs.
    property reserved_instances_offering_ids : Array(String) | Nil

    # The ID of the Availability Zone.
    #
    # Either `AvailabilityZone` or `AvailabilityZoneId` can be specified, but not both.
    property availability_zone_id : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # One or more filters.
    #
    # - `availability-zone` - The Availability Zone where the Reserved Instance can be used.
    #
    # - `availability-zone-id` - The ID of the Availability Zone where the Reserved Instance can be
    # used.
    #
    # - `duration` - The duration of the Reserved Instance (for example, one year or three years), in
    # seconds (`31536000` | `94608000`).
    #
    # - `fixed-price` - The purchase price of the Reserved Instance (for example, 9800.0).
    #
    # - `instance-type` - The instance type that is covered by the reservation.
    #
    # - `marketplace` - Set to `true` to show only Reserved Instance Marketplace offerings. When this
    # filter is not used, which is the default behavior, all offerings from both Amazon Web Services
    # and the Reserved Instance Marketplace are listed.
    #
    # - `product-description` - The Reserved Instance product platform description (`Linux/UNIX` |
    # `Linux with SQL Server Standard` | `Linux with SQL Server Web` | `Linux with SQL Server
    # Enterprise` | `SUSE Linux` | `Red Hat Enterprise Linux` | `Red Hat Enterprise Linux with HA` |
    # `Windows` | `Windows with SQL Server Standard` | `Windows with SQL Server Web` | `Windows with
    # SQL Server Enterprise`).
    #
    # - `reserved-instances-offering-id` - The Reserved Instances offering ID.
    #
    # - `scope` - The scope of the Reserved Instance (`Availability Zone` or `Region`).
    #
    # - `usage-price` - The usage price of the Reserved Instance, per hour (for example, 0.84).
    property filters : Array(Filter) | Nil

    # The tenancy of the instances covered by the reservation. A Reserved Instance with a tenancy of
    # `dedicated` is applied to instances that run in a VPC on single-tenant hardware (i.e., Dedicated
    # Instances).
    #
    # **Important:** The `host` value cannot be used with this parameter. Use the `default` or
    # `dedicated` values only.
    #
    # Default: `default`
    property instance_tenancy : Tenancy | Nil

    # The Reserved Instance offering type. If you are using tools that predate the 2011-11-01 API
    # version, you only have access to the `Medium Utilization` Reserved Instance offering type.
    property offering_type : OfferingTypeValues | Nil

    # The token to retrieve the next page of results.
    property next_token : String | Nil

    # The maximum number of results to return for the request in a single page. The remaining results
    # of the initial request can be seen by sending another request with the returned `NextToken`
    # value. The maximum is 100.
    #
    # Default: 100
    property max_results : Int32 | Nil

    def initialize(
      @availability_zone : String | Nil = nil,
      @include_marketplace : Bool | Nil = nil,
      @instance_type : InstanceType | Nil = nil,
      @max_duration : Int64 | Nil = nil,
      @max_instance_count : Int32 | Nil = nil,
      @min_duration : Int64 | Nil = nil,
      @offering_class : OfferingClassType | Nil = nil,
      @product_description : RIProductDescription | Nil = nil,
      @reserved_instances_offering_ids : Array(String) | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @instance_tenancy : Tenancy | Nil = nil,
      @offering_type : OfferingTypeValues | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @include_marketplace
        params << {"#{prefix}IncludeMarketplace", Core::QueryValue.bool(value)}
      end

      if value = @instance_type
        params << {"#{prefix}InstanceType", value.to_json_object_key}
      end

      if value = @max_duration
        params << {"#{prefix}MaxDuration", value.to_s}
      end

      if value = @max_instance_count
        params << {"#{prefix}MaxInstanceCount", value.to_s}
      end

      if value = @min_duration
        params << {"#{prefix}MinDuration", value.to_s}
      end

      if value = @offering_class
        params << {"#{prefix}OfferingClass", value.to_json_object_key}
      end

      if value = @product_description
        params << {"#{prefix}ProductDescription", value.to_json_object_key}
      end

      (@reserved_instances_offering_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ReservedInstancesOfferingId.#{i}", item}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      if value = @instance_tenancy
        params << {"#{prefix}InstanceTenancy", value.to_json_object_key}
      end

      if value = @offering_type
        params << {"#{prefix}OfferingType", value.to_json_object_key}
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
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='AvailabilityZone']")),
        include_marketplace: Core::XMLValue.bool(node.xpath_node("*[local-name()='IncludeMarketplace']")),
        instance_type: (n = node.xpath_node("*[local-name()='InstanceType']")) ? AEC::InstanceType.from_json_object_key?(n.content) : nil,
        max_duration: Core::XMLValue.i64(node.xpath_node("*[local-name()='MaxDuration']")),
        max_instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxInstanceCount']")),
        min_duration: Core::XMLValue.i64(node.xpath_node("*[local-name()='MinDuration']")),
        offering_class: (n = node.xpath_node("*[local-name()='OfferingClass']")) ? AEC::OfferingClassType.from_json_object_key?(n.content) : nil,
        product_description: (n = node.xpath_node("*[local-name()='ProductDescription']")) ? AEC::RIProductDescription.from_json_object_key?(n.content) : nil,
        reserved_instances_offering_ids: node.xpath_nodes("*[local-name()='ReservedInstancesOfferingId']/*[local-name()='item']").map { |n| n.content },
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AvailabilityZoneId']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        instance_tenancy: (n = node.xpath_node("*[local-name()='instanceTenancy']")) ? AEC::Tenancy.from_json_object_key?(n.content) : nil,
        offering_type: (n = node.xpath_node("*[local-name()='offeringType']")) ? AEC::OfferingTypeValues.from_json_object_key?(n.content) : nil,
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='maxResults']")),
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@availability_zone, @include_marketplace, @instance_type, @max_duration, @max_instance_count, @min_duration, @offering_class, @product_description, @reserved_instances_offering_ids, @availability_zone_id, @dry_run, @filters, @instance_tenancy, @offering_type, @next_token, @max_results)
  end
end
