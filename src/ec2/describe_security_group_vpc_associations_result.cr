private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeSecurityGroupVpcAssociationsResult
    # The security group VPC associations.
    property security_group_vpc_associations : Array(SecurityGroupVpcAssociation) | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    def initialize(
      @security_group_vpc_associations : Array(SecurityGroupVpcAssociation) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@security_group_vpc_associations || [] of SecurityGroupVpcAssociation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SecurityGroupVpcAssociationSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        security_group_vpc_associations: node.xpath_nodes("*[local-name()='securityGroupVpcAssociationSet']/*[local-name()='item']").map { |n| SecurityGroupVpcAssociation.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @security_group_vpc_associations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@security_group_vpc_associations, @next_token)
  end
end
