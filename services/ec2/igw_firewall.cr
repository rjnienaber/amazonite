private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the Automated Internet Firewall that inspects traffic for an internet gateway or
  # egress-only internet gateway route.
  class IgwFirewall
    # The ARN of the firewall that inspects traffic for this route.
    property firewall_arn : String | Nil

    # The status of the firewall that inspects traffic for this route. Uses the same values as
    # `NetworkFirewallAssociation$firewallOnboardingStatus`: `active`, `disabling`, or `pending`.
    property status : FirewallOnboardingStatus | Nil

    def initialize(
      @firewall_arn : String | Nil = nil,
      @status : FirewallOnboardingStatus | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @firewall_arn
        params << {"#{prefix}FirewallArn", value}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        firewall_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='firewallArn']")),
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::FirewallOnboardingStatus.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@firewall_arn, @status)
  end
end
