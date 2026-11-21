private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an Automated Internet Firewall that inspects traffic between a VPC and its internet
  # gateway or egress-only internet gateway.
  class NetworkFirewallAssociation
    # The Amazon Resource Name (ARN) of the firewall.
    property firewall_arn : String | Nil

    # The status of the firewall for the VPC. Possible values:
    #
    # - `active`: The firewall inspects traffic for the VPC.
    #
    # - `disabling`: AWS is removing the firewall from the VPC.
    #
    # - `pending`: AWS is setting up the firewall for the VPC. The firewall might not inspect traffic
    # yet.
    property firewall_onboarding_status : FirewallOnboardingStatus | Nil

    # The mode of the firewall. Possible values:
    #
    # - `enforce`: The firewall applies its policy to traffic.
    #
    # - `monitor`: The firewall logs traffic that its policy would act on, but doesn't block it.
    property firewall_mode : FirewallMode | Nil

    def initialize(
      @firewall_arn : String | Nil = nil,
      @firewall_onboarding_status : FirewallOnboardingStatus | Nil = nil,
      @firewall_mode : FirewallMode | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @firewall_arn
        params << {"#{prefix}FirewallArn", value}
      end

      if value = @firewall_onboarding_status
        params << {"#{prefix}FirewallOnboardingStatus", value.to_json_object_key}
      end

      if value = @firewall_mode
        params << {"#{prefix}FirewallMode", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        firewall_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='firewallArn']")),
        firewall_onboarding_status: (n = node.xpath_node("*[local-name()='firewallOnboardingStatus']")) ? AEC::FirewallOnboardingStatus.from_json_object_key?(n.content) : nil,
        firewall_mode: (n = node.xpath_node("*[local-name()='firewallMode']")) ? AEC::FirewallMode.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@firewall_arn, @firewall_onboarding_status, @firewall_mode)
  end
end
