private alias Core = Amazonite::Core

module Amazonite::EC2
  class AssociateTransitGatewayRouteTableResult
    # The ID of the association.
    property association : TransitGatewayAssociation | Nil

    def initialize(
      @association : TransitGatewayAssociation | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @association
        params.concat(value.to_query_params("#{prefix}Association."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        association: node.xpath_node("*[local-name()='association']").try { |n| TransitGatewayAssociation.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @association
        value.validate!
      end
    end

    def_equals_and_hash(@association)
  end
end
