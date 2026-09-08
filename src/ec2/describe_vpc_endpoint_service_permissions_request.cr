private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeVpcEndpointServicePermissionsRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the service.
    property service_id : String

    # The filters.
    #
    # - `principal` - The ARN of the principal.
    #
    # - `principal-type` - The principal type (`All` | `Service` | `OrganizationUnit` | `Account` |
    # `User` | `Role`).
    property filters : Array(Filter) | Nil

    # The maximum number of results to return for the request in a single page. The remaining results
    # of the initial request can be seen by sending another request with the returned `NextToken`
    # value. This value can be between 5 and 1,000; if `MaxResults` is given a value larger than
    # 1,000, only 1,000 results are returned.
    property max_results : Int32 | Nil

    # The token to retrieve the next page of results.
    property next_token : String | Nil

    def initialize(
      @service_id : String,
      @dry_run : Bool | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}ServiceId", @service_id}

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
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        service_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceId']")).not_nil!,
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @service_id, @filters, @max_results, @next_token)
  end
end
