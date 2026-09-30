private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeElasticGpusResult
    # Information about the Elastic Graphics accelerators.
    property elastic_gpu_set : Array(ElasticGpus) | Nil

    # The total number of items to return. If the total number of items available is more than the
    # value specified in max-items then a Next-Token will be provided in the output that you can use
    # to resume pagination.
    property max_results : Int32 | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @elastic_gpu_set : Array(ElasticGpus) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@elastic_gpu_set || [] of ElasticGpus).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ElasticGpuSet.#{i}."))
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
        elastic_gpu_set: node.xpath_nodes("*[local-name()='elasticGpuSet']/*[local-name()='item']").map { |n| ElasticGpus.from_xml(n) },
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='maxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @elastic_gpu_set
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@elastic_gpu_set, @max_results, @next_token)
  end
end
