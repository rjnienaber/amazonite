private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifySecurityGroupRulesRequest
    # The ID of the security group.
    property group_id : String

    # Information about the security group properties to update.
    property security_group_rules : Array(SecurityGroupRuleUpdate) = [] of SecurityGroupRuleUpdate

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @group_id : String,
      @security_group_rules : Array(SecurityGroupRuleUpdate),
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}GroupId", @group_id}

      @security_group_rules.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SecurityGroupRule.#{i}."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupId']")).not_nil!,
        security_group_rules: node.xpath_nodes("*[local-name()='SecurityGroupRule']/*[local-name()='item']").map { |n| SecurityGroupRuleUpdate.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @security_group_rules
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@group_id, @security_group_rules, @dry_run)
  end
end
