private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeHostReservationsRequest
    # The filters.
    #
    # - `instance-family` - The instance family (for example, `m4`).
    #
    # - `payment-option` - The payment option (`NoUpfront` | `PartialUpfront` | `AllUpfront`).
    #
    # - `state` - The state of the reservation (`payment-pending` | `payment-failed` | `active` |
    # `retired`).
    #
    # - `tag:` - The key/value combination of a tag assigned to the resource. Use the tag key in the
    # filter name and the tag value as the filter value. For example, to find all resources that have
    # a tag with the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and
    # `TeamA` for the filter value.
    #
    # - `tag-key` - The key of a tag assigned to the resource. Use this filter to find all resources
    # assigned a tag with a specific key, regardless of the tag value.
    property filter : Array(Filter) | Nil

    # The host reservation IDs.
    property host_reservation_id_set : Array(String) | Nil

    # The maximum number of results to return for the request in a single page. The remaining results
    # can be seen by sending another request with the returned `nextToken` value. This value can be
    # between 5 and 500. If `maxResults` is given a larger value than 500, you receive an error.
    property max_results : Int32 | Nil

    # The token to use to retrieve the next page of results.
    property next_token : String | Nil

    def initialize(
      @filter : Array(Filter) | Nil = nil,
      @host_reservation_id_set : Array(String) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@filter || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      (@host_reservation_id_set || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}HostReservationIdSet.#{i}", item}
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
        filter: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        host_reservation_id_set: node.xpath_nodes("*[local-name()='HostReservationIdSet']/*[local-name()='item']").map { |n| n.content },
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def validate! : Nil
      if value = @filter
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@filter, @host_reservation_id_set, @max_results, @next_token)
  end
end
