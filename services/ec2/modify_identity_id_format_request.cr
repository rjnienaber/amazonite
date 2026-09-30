private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyIdentityIdFormatRequest
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

    # Indicates whether the resource should use longer IDs (17-character IDs)
    property use_long_ids : Bool

    # The ARN of the principal, which can be an IAM user, IAM role, or the root user. Specify `all` to
    # modify the ID format for all IAM users, IAM roles, and the root user of the account.
    property principal_arn : String

    def initialize(
      @resource : String,
      @use_long_ids : Bool,
      @principal_arn : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Resource", @resource}

      params << {"#{prefix}UseLongIds", Core::QueryValue.bool(@use_long_ids)}

      params << {"#{prefix}PrincipalArn", @principal_arn}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource: Core::XMLValue.string(node.xpath_node("*[local-name()='resource']")).not_nil!,
        use_long_ids: Core::XMLValue.bool(node.xpath_node("*[local-name()='useLongIds']")).not_nil!,
        principal_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='principalArn']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@resource, @use_long_ids, @principal_arn)
  end
end
