private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetIpamResourceCidrsResult
    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    # The resource CIDRs.
    property ipam_resource_cidrs : Array(IpamResourceCidr) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @ipam_resource_cidrs : Array(IpamResourceCidr) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@ipam_resource_cidrs || [] of IpamResourceCidr).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}IpamResourceCidrSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        ipam_resource_cidrs: node.xpath_nodes("*[local-name()='ipamResourceCidrSet']/*[local-name()='item']").map { |n| IpamResourceCidr.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ipam_resource_cidrs
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @ipam_resource_cidrs)
  end
end
