private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeElasticGpusRequest
    # The Elastic Graphics accelerator IDs.
    property elastic_gpu_ids : Array(String) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The filters.
    #
    # - `availability-zone` - The Availability Zone in which the Elastic Graphics accelerator resides.
    #
    # - `elastic-gpu-health` - The status of the Elastic Graphics accelerator (`OK` | `IMPAIRED`).
    #
    # - `elastic-gpu-state` - The state of the Elastic Graphics accelerator (`ATTACHED`).
    #
    # - `elastic-gpu-type` - The type of Elastic Graphics accelerator; for example, `eg1.medium`.
    #
    # - `instance-id` - The ID of the instance to which the Elastic Graphics accelerator is
    # associated.
    property filters : Array(Filter) | Nil

    # The maximum number of results to return in a single call. To retrieve the remaining results,
    # make another call with the returned `NextToken` value. This value can be between 5 and 1000.
    property max_results : Int32 | Nil

    # The token to request the next page of results.
    property next_token : String | Nil

    def initialize(
      @elastic_gpu_ids : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@elastic_gpu_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ElasticGpuId.#{i}", item}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
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
        elastic_gpu_ids: node.xpath_nodes("*[local-name()='ElasticGpuId']/*[local-name()='item']").map { |n| n.content },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
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
        raise Core::ValidationError.new("MaxResults value must be >= 10") if value < 10
        raise Core::ValidationError.new("MaxResults value must be <= 1000") if value > 1000
      end
    end

    def_equals_and_hash(@elastic_gpu_ids, @dry_run, @filters, @max_results, @next_token)
  end
end
