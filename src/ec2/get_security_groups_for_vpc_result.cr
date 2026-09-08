private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetSecurityGroupsForVpcResult
    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    # The security group that can be used by interfaces in the VPC.
    property security_group_for_vpcs : Array(SecurityGroupForVpc) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @security_group_for_vpcs : Array(SecurityGroupForVpc) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@security_group_for_vpcs || [] of SecurityGroupForVpc).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SecurityGroupForVpcSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        security_group_for_vpcs: node.xpath_nodes("*[local-name()='securityGroupForVpcSet']/*[local-name()='item']").map { |n| SecurityGroupForVpc.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @security_group_for_vpcs
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @security_group_for_vpcs)
  end
end
