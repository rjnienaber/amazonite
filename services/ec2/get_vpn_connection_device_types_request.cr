private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetVpnConnectionDeviceTypesRequest
    # The maximum number of results returned by `GetVpnConnectionDeviceTypes` in paginated output.
    # When this parameter is used, `GetVpnConnectionDeviceTypes` only returns `MaxResults` results in
    # a single page along with a `NextToken` response element. The remaining results of the initial
    # request can be seen by sending another `GetVpnConnectionDeviceTypes` request with the returned
    # `NextToken` value. This value can be between 200 and 1000. If this parameter is not used, then
    # `GetVpnConnectionDeviceTypes` returns all results.
    property max_results : Int32 | Nil

    # The `NextToken` value returned from a previous paginated `GetVpnConnectionDeviceTypes` request
    # where `MaxResults` was used and the results exceeded the value of that parameter. Pagination
    # continues from the end of the previous results that returned the `NextToken` value. This value
    # is null when there are no more results to return.
    property next_token : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 200") if value < 200
        raise Core::ValidationError.new("MaxResults value must be <= 1000") if value > 1000
      end
    end

    def_equals_and_hash(@max_results, @next_token, @dry_run)
  end
end
