private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeVpcEndpointAssociationsResult
    # Details of the endpoint associations.
    property vpc_endpoint_associations : Array(VpcEndpointAssociation) | Nil

    # The pagination token.
    property next_token : String | Nil

    def initialize(
      @vpc_endpoint_associations : Array(VpcEndpointAssociation) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@vpc_endpoint_associations || [] of VpcEndpointAssociation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}VpcEndpointAssociationSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpc_endpoint_associations: node.xpath_nodes("*[local-name()='vpcEndpointAssociationSet']/*[local-name()='item']").map { |n| VpcEndpointAssociation.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @vpc_endpoint_associations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@vpc_endpoint_associations, @next_token)
  end
end
