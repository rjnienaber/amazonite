private alias Core = Amazonite::Core

module Amazonite::EC2
  class DisassociateClientVpnTargetNetworkResult
    # The ID of the target network association.
    property association_id : String | Nil

    # The current state of the target network association.
    property status : AssociationStatus | Nil

    def initialize(
      @association_id : String | Nil = nil,
      @status : AssociationStatus | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @association_id
        params << {"#{prefix}AssociationId", value}
      end

      if value = @status
        params.concat(value.to_query_params("#{prefix}Status."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        association_id: Core::XMLValue.string(node.xpath_node("*[local-name()='associationId']")),
        status: node.xpath_node("*[local-name()='status']").try { |n| AssociationStatus.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @status
        value.validate!
      end
    end

    def_equals_and_hash(@association_id, @status)
  end
end
