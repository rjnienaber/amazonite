private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeRegionsRequest
    # The names of the Regions. You can specify any Regions, whether they are enabled and disabled for
    # your account.
    property region_names : Array(String) | Nil

    # Indicates whether to display all Regions, including Regions that are disabled for your account.
    property all_regions : Bool | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The filters.
    #
    # - `endpoint` - The endpoint of the Region (for example, `ec2.us-east-1.amazonaws.com`).
    #
    # - `opt-in-status` - The opt-in status of the Region (`opt-in-not-required` | `opted-in` |
    # `not-opted-in`).
    #
    # - `region-name` - The name of the Region (for example, `us-east-1`).
    property filters : Array(Filter) | Nil

    def initialize(
      @region_names : Array(String) | Nil = nil,
      @all_regions : Bool | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@region_names || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}RegionName.#{i}", item}
      end

      if value = @all_regions
        params << {"#{prefix}AllRegions", Core::QueryValue.bool(value)}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        region_names: node.xpath_nodes("*[local-name()='RegionName']/*[local-name()='RegionName']").map { |n| n.content },
        all_regions: Core::XMLValue.bool(node.xpath_node("*[local-name()='AllRegions']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@region_names, @all_regions, @dry_run, @filters)
  end
end
