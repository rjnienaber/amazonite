private alias Core = Amazonite::Core

module Amazonite::EC2
  class AssociateAddressResult
    # The ID that represents the association of the Elastic IP address with an instance.
    property association_id : String | Nil

    def initialize(
      @association_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @association_id
        params << {"#{prefix}AssociationId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        association_id: Core::XMLValue.string(node.xpath_node("*[local-name()='associationId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@association_id)
  end
end
