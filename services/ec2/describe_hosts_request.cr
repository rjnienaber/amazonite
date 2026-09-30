private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeHostsRequest
    # The IDs of the Dedicated Hosts. The IDs are used for targeted instance launches.
    property host_ids : Array(String) | Nil

    # The token to use to retrieve the next page of results.
    property next_token : String | Nil

    # The maximum number of results to return for the request in a single page. The remaining results
    # can be seen by sending another request with the returned `nextToken` value. This value can be
    # between 5 and 500. If `maxResults` is given a larger value than 500, you receive an error.
    #
    # You cannot specify this parameter and the host IDs parameter in the same request.
    property max_results : Int32 | Nil

    # The filters.
    #
    # - `auto-placement` - Whether auto-placement is enabled or disabled (`on` | `off`).
    #
    # - `availability-zone` - The Availability Zone of the host.
    #
    # - `client-token` - The idempotency token that you provided when you allocated the host.
    #
    # - `host-reservation-id` - The ID of the reservation assigned to this host.
    #
    # - `instance-type` - The instance type size that the Dedicated Host is configured to support.
    #
    # - `state` - The allocation state of the Dedicated Host (`available` | `under-assessment` |
    # `permanent-failure` | `released` | `released-permanent-failure`).
    #
    # - `tag-key` - The key of a tag assigned to the resource. Use this filter to find all resources
    # assigned a tag with a specific key, regardless of the tag value.
    property filter : Array(Filter) | Nil

    def initialize(
      @host_ids : Array(String) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @filter : Array(Filter) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@host_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}HostId.#{i}", item}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      (@filter || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        host_ids: node.xpath_nodes("*[local-name()='hostId']/*[local-name()='item']").map { |n| n.content },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='maxResults']")),
        filter: node.xpath_nodes("*[local-name()='filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @filter
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@host_ids, @next_token, @max_results, @filter)
  end
end
