private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for DescribeReservedInstances.
  class DescribeReservedInstancesRequest
    # Describes whether the Reserved Instance is Standard or Convertible.
    property offering_class : OfferingClassType | Nil

    # One or more Reserved Instance IDs.
    #
    # Default: Describes all your Reserved Instances, or only those otherwise specified.
    property reserved_instances_ids : Array(String) | Nil

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
    # - `duration` - The duration of the Reserved Instance (one year or three years), in seconds
    # (`31536000` | `94608000`).
    #
    # - `end` - The time when the Reserved Instance expires (for example, 2015-08-07T11:54:42.000Z).
    #
    # - `fixed-price` - The purchase price of the Reserved Instance (for example, 9800.0).
    #
    # - `instance-type` - The instance type that is covered by the reservation.
    #
    # - `scope` - The scope of the Reserved Instance (`Region` or `Availability Zone`).
    #
    # - `product-description` - The Reserved Instance product platform description (`Linux/UNIX` |
    # `Linux with SQL Server Standard` | `Linux with SQL Server Web` | `Linux with SQL Server
    # Enterprise` | `SUSE Linux` | `Red Hat Enterprise Linux` | `Red Hat Enterprise Linux with HA` |
    # `Windows` | `Windows with SQL Server Standard` | `Windows with SQL Server Web` | `Windows with
    # SQL Server Enterprise`).
    #
    # - `reserved-instances-id` - The ID of the Reserved Instance.
    #
    # - `start` - The time at which the Reserved Instance purchase request was placed (for example,
    # 2014-08-07T11:54:42.000Z).
    #
    # - `state` - The state of the Reserved Instance (`payment-pending` | `active` | `payment-failed`
    # | `retired`).
    #
    # - `tag:` - The key/value combination of a tag assigned to the resource. Use the tag key in the
    # filter name and the tag value as the filter value. For example, to find all resources that have
    # a tag with the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and
    # `TeamA` for the filter value.
    #
    # - `tag-key` - The key of a tag assigned to the resource. Use this filter to find all resources
    # assigned a tag with a specific key, regardless of the tag value.
    #
    # - `usage-price` - The usage price of the Reserved Instance, per hour (for example, 0.84).
    property filters : Array(Filter) | Nil

    # The Reserved Instance offering type. If you are using tools that predate the 2011-11-01 API
    # version, you only have access to the `Medium Utilization` Reserved Instance offering type.
    property offering_type : OfferingTypeValues | Nil

    def initialize(
      @offering_class : OfferingClassType | Nil = nil,
      @reserved_instances_ids : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @offering_type : OfferingTypeValues | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @offering_class
        params << {"#{prefix}OfferingClass", value.to_json_object_key}
      end

      (@reserved_instances_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ReservedInstancesId.#{i}", item}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      if value = @offering_type
        params << {"#{prefix}OfferingType", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        offering_class: (n = node.xpath_node("*[local-name()='OfferingClass']")) ? AEC::OfferingClassType.from_json_object_key?(n.content) : nil,
        reserved_instances_ids: node.xpath_nodes("*[local-name()='ReservedInstancesId']/*[local-name()='ReservedInstancesId']").map { |n| n.content },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        offering_type: (n = node.xpath_node("*[local-name()='offeringType']")) ? AEC::OfferingTypeValues.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@offering_class, @reserved_instances_ids, @dry_run, @filters, @offering_type)
  end
end
