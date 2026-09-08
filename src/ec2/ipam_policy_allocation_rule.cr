private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about an IPAM policy allocation rule.
  #
  # Allocation rules are optional configurations within an IPAM policy that map Amazon Web Services
  # resource types to specific IPAM pools. If no rules are defined, the resource types default to
  # using Amazon-provided IP addresses.
  class IpamPolicyAllocationRule
    # The ID of the source IPAM pool for the allocation rule.
    #
    # An IPAM pool is a collection of IP addresses in IPAM that can be allocated to Amazon Web
    # Services resources.
    property source_ipam_pool_id : String | Nil

    def initialize(
      @source_ipam_pool_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @source_ipam_pool_id
        params << {"#{prefix}SourceIpamPoolId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        source_ipam_pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='sourceIpamPoolId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@source_ipam_pool_id)
  end
end
