private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeIdentityIdFormatRequest
    # The type of resource: `bundle` | `conversion-task` | `customer-gateway` | `dhcp-options` |
    # `elastic-ip-allocation` | `elastic-ip-association` | `export-task` | `flow-log` | `image` |
    # `import-task` | `instance` | `internet-gateway` | `network-acl` | `network-acl-association` |
    # `network-interface` | `network-interface-attachment` | `prefix-list` | `reservation` |
    # `route-table` | `route-table-association` | `security-group` | `snapshot` | `subnet` |
    # `subnet-cidr-block-association` | `volume` | `vpc` | `vpc-cidr-block-association` |
    # `vpc-endpoint` | `vpc-peering-connection` | `vpn-connection` | `vpn-gateway`
    property resource : String | Nil

    # The ARN of the principal, which can be an IAM role, IAM user, or the root user.
    property principal_arn : String

    def initialize(
      @principal_arn : String,
      @resource : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @resource
        params << {"#{prefix}Resource", value}
      end

      params << {"#{prefix}PrincipalArn", @principal_arn}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource: Core::XMLValue.string(node.xpath_node("*[local-name()='resource']")),
        principal_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='principalArn']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@resource, @principal_arn)
  end
end
