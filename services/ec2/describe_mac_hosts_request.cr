private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeMacHostsRequest
    # The filters.
    #
    # - `availability-zone` - The Availability Zone of the EC2 Mac Dedicated Host.
    #
    # - `instance-type` - The instance type size that the EC2 Mac Dedicated Host is configured to
    # support.
    property filters : Array(Filter) | Nil

    # The IDs of the EC2 Mac Dedicated Hosts.
    property host_ids : Array(String) | Nil

    # The maximum number of results to return for the request in a single page. The remaining results
    # can be seen by sending another request with the returned `nextToken` value. This value can be
    # between 5 and 500. If `maxResults` is given a larger value than 500, you receive an error.
    property max_results : Int32 | Nil

    # The token to use to retrieve the next page of results.
    property next_token : String | Nil

    def initialize(
      @filters : Array(Filter) | Nil = nil,
      @host_ids : Array(String) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      (@host_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}HostId.#{i}", item}
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
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        host_ids: node.xpath_nodes("*[local-name()='HostId']/*[local-name()='item']").map { |n| n.content },
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
        raise Core::ValidationError.new("MaxResults value must be <= 500") if value > 500
      end
    end

    def_equals_and_hash(@filters, @host_ids, @max_results, @next_token)
  end
end
