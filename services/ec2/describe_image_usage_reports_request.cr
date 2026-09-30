private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeImageUsageReportsRequest
    # The IDs of the images for filtering the reports. If specified, only reports containing these
    # images are returned.
    property image_ids : Array(String) | Nil

    # The IDs of the image usage reports.
    property report_ids : Array(String) | Nil

    # The token returned from a previous paginated request. Pagination continues from the end of the
    # items returned by the previous request.
    property next_token : String | Nil

    # The filters.
    #
    # - `creation-time` - The time when the report was created, in the ISO 8601 format in the UTC time
    # zone (YYYY-MM-DDThh:mm:ss.sssZ), for example, `2025-11-29T11:04:43.305Z`. You can use a wildcard
    # (`*`), for example, `2025-11-29T*`, which matches an entire day.
    #
    # - `state` - The state of the report (`available` | `pending` | `error`).
    #
    # - `tag:` - The key/value combination of a tag assigned to the resource. Use the tag key in the
    # filter name and the tag value as the filter value. For example, to find all resources that have
    # a tag with the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and
    # `TeamA` for the filter value.
    #
    # - `tag-key` - The key of a tag assigned to the resource. Use this filter to find all resources
    # assigned a tag with a specific key, regardless of the tag value.
    property filters : Array(Filter) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    property max_results : Int32 | Nil

    def initialize(
      @image_ids : Array(String) | Nil = nil,
      @report_ids : Array(String) | Nil = nil,
      @next_token : String | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@image_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ImageId.#{i}", item}
      end

      (@report_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ReportId.#{i}", item}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        image_ids: node.xpath_nodes("*[local-name()='ImageId']/*[local-name()='item']").map { |n| n.content },
        report_ids: node.xpath_nodes("*[local-name()='ReportId']/*[local-name()='item']").map { |n| n.content },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
      )
    end

    def validate! : Nil
      if value = @image_ids
        raise Core::ValidationError.new("ImageIds must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("ImageIds must have at most 200 item(s)") if value.size > 200
      end

      if value = @report_ids
        raise Core::ValidationError.new("ReportIds must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("ReportIds must have at most 200 item(s)") if value.size > 200
      end

      if value = @filters
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
      end
    end

    def_equals_and_hash(@image_ids, @report_ids, @next_token, @filters, @dry_run, @max_results)
  end
end
