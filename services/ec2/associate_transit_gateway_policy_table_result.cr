private alias Core = Amazonite::Core

module Amazonite::EC2
  class AssociateTransitGatewayPolicyTableResult
    # Describes the association of a transit gateway and a transit gateway policy table.
    property association : TransitGatewayPolicyTableAssociation | Nil

    def initialize(
      @association : TransitGatewayPolicyTableAssociation | Nil = nil,
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
        association: node.xpath_node("*[local-name()='association']").try { |n| TransitGatewayPolicyTableAssociation.from_xml(n) },
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
