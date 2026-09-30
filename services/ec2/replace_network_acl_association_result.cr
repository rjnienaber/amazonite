private alias Core = Amazonite::Core

module Amazonite::EC2
  class ReplaceNetworkAclAssociationResult
    # The ID of the new association.
    property new_association_id : String | Nil

    def initialize(
      @new_association_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @new_association_id
        params << {"#{prefix}NewAssociationId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        new_association_id: Core::XMLValue.string(node.xpath_node("*[local-name()='newAssociationId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@new_association_id)
  end
end
