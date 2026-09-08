private alias Core = Amazonite::Core

module Amazonite::EC2
  class DisassociateSubnetCidrBlockRequest
    # The association ID for the CIDR block.
    property association_id : String

    def initialize(
      @association_id : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}AssociationId", @association_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        association_id: Core::XMLValue.string(node.xpath_node("*[local-name()='associationId']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@association_id)
  end
end
