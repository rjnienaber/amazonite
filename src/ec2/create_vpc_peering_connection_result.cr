private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateVpcPeeringConnectionResult
    # Information about the VPC peering connection.
    property vpc_peering_connection : VpcPeeringConnection | Nil

    def initialize(
      @vpc_peering_connection : VpcPeeringConnection | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @vpc_peering_connection
        params.concat(value.to_query_params("#{prefix}VpcPeeringConnection."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpc_peering_connection: node.xpath_node("*[local-name()='vpcPeeringConnection']").try { |n| VpcPeeringConnection.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @vpc_peering_connection
        value.validate!
      end
    end

    def_equals_and_hash(@vpc_peering_connection)
  end
end
