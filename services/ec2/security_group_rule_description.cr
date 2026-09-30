private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the description of a security group rule.
  #
  # You can use this when you want to update the security group rule description for either an
  # inbound or outbound rule.
  class SecurityGroupRuleDescription
    # The ID of the security group rule.
    property security_group_rule_id : String | Nil

    # The description of the security group rule.
    property description : String | Nil

    def initialize(
      @security_group_rule_id : String | Nil = nil,
      @description : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @security_group_rule_id
        params << {"#{prefix}SecurityGroupRuleId", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        security_group_rule_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SecurityGroupRuleId']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@security_group_rule_id, @description)
  end
end
