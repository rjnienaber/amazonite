private alias Core = Amazonite::Core

module Amazonite::EC2
  class DisassociateTransitGatewayMulticastDomainResult
    # Information about the association.
    property associations : TransitGatewayMulticastDomainAssociations | Nil

    def initialize(
      @associations : TransitGatewayMulticastDomainAssociations | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @associations
        params.concat(value.to_query_params("#{prefix}Associations."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        associations: node.xpath_node("*[local-name()='associations']").try { |n| TransitGatewayMulticastDomainAssociations.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @associations
        value.validate!
      end
    end

    def_equals_and_hash(@associations)
  end
end
