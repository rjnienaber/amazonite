private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeStoreImageTasksRequest
    # The AMI IDs for which to show progress. Up to 20 AMI IDs can be included in a request.
    property image_ids : Array(String) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The filters.
    #
    # - `task-state` - Returns tasks in a certain state (`InProgress` | `Completed` | `Failed`)
    #
    # - `bucket` - Returns task information for tasks that targeted a specific bucket. For the filter
    # value, specify the bucket name.
    #
    # When you specify the `ImageIds` parameter, any filters that you specify are ignored. To use the
    # filters, you must remove the `ImageIds` parameter.
    property filters : Array(Filter) | Nil

    # The token returned from a previous paginated request. Pagination continues from the end of the
    # items returned by the previous request.
    property next_token : String | Nil

    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    #
    # You cannot specify this parameter and the `ImageIds` parameter in the same call.
    property max_results : Int32 | Nil

    def initialize(
      @image_ids : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@image_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ImageId.#{i}", item}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
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
        image_ids: node.xpath_nodes("*[local-name()='ImageId']/*[local-name()='item']").map { |n| n.content },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 200") if value > 200
      end
    end

    def_equals_and_hash(@image_ids, @dry_run, @filters, @next_token, @max_results)
  end
end
