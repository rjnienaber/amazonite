private alias Core = Amazonite::Core

module Amazonite::EC2
  class RevokeSecurityGroupEgressResult
    # Returns `true` if the request succeeds; otherwise, returns an error.
    property return : Bool | Nil

    # The outbound rules that were unknown to the service. In some cases, `unknownIpPermissionSet`
    # might be in a different format from the request parameter.
    property unknown_ip_permissions : Array(IpPermission) | Nil

    # Details about the revoked security group rules.
    property revoked_security_group_rules : Array(RevokedSecurityGroupRule) | Nil

    def initialize(
      @return : Bool | Nil = nil,
      @unknown_ip_permissions : Array(IpPermission) | Nil = nil,
      @revoked_security_group_rules : Array(RevokedSecurityGroupRule) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @return
        params << {"#{prefix}Return", Core::QueryValue.bool(value)}
      end

      (@unknown_ip_permissions || [] of IpPermission).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}UnknownIpPermissionSet.#{i}."))
      end

      (@revoked_security_group_rules || [] of RevokedSecurityGroupRule).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RevokedSecurityGroupRuleSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        return: Core::XMLValue.bool(node.xpath_node("*[local-name()='return']")),
        unknown_ip_permissions: node.xpath_nodes("*[local-name()='unknownIpPermissionSet']/*[local-name()='item']").map { |n| IpPermission.from_xml(n) },
        revoked_security_group_rules: node.xpath_nodes("*[local-name()='revokedSecurityGroupRuleSet']/*[local-name()='item']").map { |n| RevokedSecurityGroupRule.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @unknown_ip_permissions
        value.each(&.validate!)
      end

      if value = @revoked_security_group_rules
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@return, @unknown_ip_permissions, @revoked_security_group_rules)
  end
end
