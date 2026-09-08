private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeInstanceSqlHaStatesRequest
    # The IDs of the SQL Server High Availability instances to describe. If omitted, the API returns
    # SQL Server High Availability states for all SQL Server High Availability instances.
    property instance_ids : Array(String) | Nil

    # The token to use to retrieve the next page of results.
    property next_token : String | Nil

    # The maximum number of results to return for the request in a single page. The remaining results
    # can be seen by sending another request with the returned `nextToken` value.
    property max_results : Int32 | Nil

    # One or more filters to apply to the results. Supported filters include:
    #
    # - `tag:` - The tag key and value pair assigned to the instance. For example, to find all
    # instances tagged with `Owner:TeamA`, specify `tag:Owner` for the filter name and `TeamA` for the
    # filter value.
    #
    # - `tag-key` - The tag key assigned to the instance.
    #
    # - `haStatus` - The SQL Server High Availability status of the SQL Server High Availability
    # instance (`processing` | `active` | `standby` | `invalid`).
    #
    # - `sqlServerLicenseUsage` - The license type for the SQL Server license (`full` | `waived`).
    property filters : Array(Filter) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @instance_ids : Array(String) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@instance_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}InstanceId.#{i}", item}
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
        instance_ids: node.xpath_nodes("*[local-name()='InstanceId']/*[local-name()='InstanceId']").map { |n| n.content },
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

    def_equals_and_hash(@instance_ids, @next_token, @max_results, @filters, @dry_run)
  end
end
