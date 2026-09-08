private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeMovingAddressesRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # One or more Elastic IP addresses.
    property public_ips : Array(String) | Nil

    # The token for the next page of results.
    property next_token : String | Nil

    # One or more filters.
    #
    # - `moving-status` - The status of the Elastic IP address (`MovingToVpc` | `RestoringToClassic`).
    property filters : Array(Filter) | Nil

    # The maximum number of results to return for the request in a single page. The remaining results
    # of the initial request can be seen by sending another request with the returned `NextToken`
    # value. This value can be between 5 and 1000; if `MaxResults` is given a value outside of this
    # range, an error is returned.
    #
    # Default: If no value is provided, the default is 1000.
    property max_results : Int32 | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @public_ips : Array(String) | Nil = nil,
      @next_token : String | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@public_ips || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}PublicIp.#{i}", item}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        public_ips: node.xpath_nodes("*[local-name()='publicIp']/*[local-name()='item']").map { |n| n.content },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        filters: node.xpath_nodes("*[local-name()='filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='maxResults']")),
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 5") if value < 5
        raise Core::ValidationError.new("MaxResults value must be <= 1000") if value > 1000
      end
    end

    def_equals_and_hash(@dry_run, @public_ips, @next_token, @filters, @max_results)
  end
end
