private alias Core = Amazonite::Core

module Amazonite::EC2
  class ReplaceRouteTableAssociationResult
    # The ID of the new association.
    property new_association_id : String | Nil

    # The state of the association.
    property association_state : RouteTableAssociationState | Nil

    def initialize(
      @new_association_id : String | Nil = nil,
      @association_state : RouteTableAssociationState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @new_association_id
        params << {"#{prefix}NewAssociationId", value}
      end

      if value = @association_state
        params.concat(value.to_query_params("#{prefix}AssociationState."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        new_association_id: Core::XMLValue.string(node.xpath_node("*[local-name()='newAssociationId']")),
        association_state: node.xpath_node("*[local-name()='associationState']").try { |n| RouteTableAssociationState.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @association_state
        value.validate!
      end
    end

    def_equals_and_hash(@new_association_id, @association_state)
  end
end
