private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribePrincipalIdFormatRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The type of resource: `bundle` | `conversion-task` | `customer-gateway` | `dhcp-options` |
    # `elastic-ip-allocation` | `elastic-ip-association` | `export-task` | `flow-log` | `image` |
    # `import-task` | `instance` | `internet-gateway` | `network-acl` | `network-acl-association` |
    # `network-interface` | `network-interface-attachment` | `prefix-list` | `reservation` |
    # `route-table` | `route-table-association` | `security-group` | `snapshot` | `subnet` |
    # `subnet-cidr-block-association` | `volume` | `vpc` | `vpc-cidr-block-association` |
    # `vpc-endpoint` | `vpc-peering-connection` | `vpn-connection` | `vpn-gateway`
    property resources : Array(String) | Nil

    # The maximum number of results to return in a single call. To retrieve the remaining results,
    # make another call with the returned NextToken value.
    property max_results : Int32 | Nil

    # The token to request the next page of results.
    property next_token : String | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @resources : Array(String) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@resources || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}Resource.#{i}", item}
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
        resources: node.xpath_nodes("*[local-name()='Resource']/*[local-name()='item']").map { |n| n.content },
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def validate! : Nil
      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 1000") if value > 1000
      end
    end

    def_equals_and_hash(@dry_run, @resources, @max_results, @next_token)
  end
end
