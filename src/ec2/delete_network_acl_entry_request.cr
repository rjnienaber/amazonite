private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteNetworkAclEntryRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the network ACL.
    property network_acl_id : String

    # The rule number of the entry to delete.
    property rule_number : Int32

    # Indicates whether the rule is an egress rule.
    property egress : Bool

    def initialize(
      @network_acl_id : String,
      @rule_number : Int32,
      @egress : Bool,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}NetworkAclId", @network_acl_id}

      params << {"#{prefix}RuleNumber", @rule_number.to_s}

      params << {"#{prefix}Egress", Core::QueryValue.bool(@egress)}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        network_acl_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkAclId']")).not_nil!,
        rule_number: Core::XMLValue.i32(node.xpath_node("*[local-name()='ruleNumber']")).not_nil!,
        egress: Core::XMLValue.bool(node.xpath_node("*[local-name()='egress']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @network_acl_id, @rule_number, @egress)
  end
end
