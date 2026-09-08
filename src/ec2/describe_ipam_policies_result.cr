private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeIpamPoliciesResult
    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    # Information about the IPAM policies.
    #
    # An IPAM policy is a set of rules that define how public IPv4 addresses from IPAM pools are
    # allocated to Amazon Web Services resources. Each rule maps an Amazon Web Services service to
    # IPAM pools that the service will use to get IP addresses. A single policy can have multiple
    # rules and be applied to multiple Amazon Web Services Regions. If the IPAM pool run out of
    # addresses then the services fallback to Amazon-provided IP addresses. A policy can be applied to
    # an individual Amazon Web Services account or an entity within Amazon Web Services Organizations.
    property ipam_policies : Array(IpamPolicy) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @ipam_policies : Array(IpamPolicy) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@ipam_policies || [] of IpamPolicy).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}IpamPolicySet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        ipam_policies: node.xpath_nodes("*[local-name()='ipamPolicySet']/*[local-name()='item']").map { |n| IpamPolicy.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ipam_policies
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @ipam_policies)
  end
end
