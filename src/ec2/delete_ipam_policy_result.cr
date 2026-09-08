private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteIpamPolicyResult
    # Information about the deleted IPAM policy.
    #
    # An IPAM policy is a set of rules that define how public IPv4 addresses from IPAM pools are
    # allocated to Amazon Web Services resources. Each rule maps an Amazon Web Services service to
    # IPAM pools that the service will use to get IP addresses. A single policy can have multiple
    # rules and be applied to multiple Amazon Web Services Regions. If the IPAM pool run out of
    # addresses then the services fallback to Amazon-provided IP addresses. A policy can be applied to
    # an individual Amazon Web Services account or an entity within Amazon Web Services Organizations.
    property ipam_policy : IpamPolicy | Nil

    def initialize(
      @ipam_policy : IpamPolicy | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipam_policy
        params.concat(value.to_query_params("#{prefix}IpamPolicy."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_policy: node.xpath_node("*[local-name()='ipamPolicy']").try { |n| IpamPolicy.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ipam_policy
        value.validate!
      end
    end

    def_equals_and_hash(@ipam_policy)
  end
end
