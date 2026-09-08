private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyIdFormatRequest
    # The type of resource: `bundle` | `conversion-task` | `customer-gateway` | `dhcp-options` |
    # `elastic-ip-allocation` | `elastic-ip-association` | `export-task` | `flow-log` | `image` |
    # `import-task` | `internet-gateway` | `network-acl` | `network-acl-association` |
    # `network-interface` | `network-interface-attachment` | `prefix-list` | `route-table` |
    # `route-table-association` | `security-group` | `subnet` | `subnet-cidr-block-association` |
    # `vpc` | `vpc-cidr-block-association` | `vpc-endpoint` | `vpc-peering-connection` |
    # `vpn-connection` | `vpn-gateway`.
    #
    # Alternatively, use the `all-current` option to include all resource types that are currently
    # within their opt-in period for longer IDs.
    property resource : String

    # Indicate whether the resource should use longer IDs (17-character IDs).
    property use_long_ids : Bool

    def initialize(
      @resource : String,
      @use_long_ids : Bool,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Resource", @resource}

      params << {"#{prefix}UseLongIds", Core::QueryValue.bool(@use_long_ids)}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource: Core::XMLValue.string(node.xpath_node("*[local-name()='Resource']")).not_nil!,
        use_long_ids: Core::XMLValue.bool(node.xpath_node("*[local-name()='UseLongIds']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@resource, @use_long_ids)
  end
end
