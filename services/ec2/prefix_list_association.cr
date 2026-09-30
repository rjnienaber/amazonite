private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the resource with which a prefix list is associated.
  class PrefixListAssociation
    # The ID of the resource.
    property resource_id : String | Nil

    # The owner of the resource.
    property resource_owner : String | Nil

    def initialize(
      @resource_id : String | Nil = nil,
      @resource_owner : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @resource_id
        params << {"#{prefix}ResourceId", value}
      end

      if value = @resource_owner
        params << {"#{prefix}ResourceOwner", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceId']")),
        resource_owner: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceOwner']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@resource_id, @resource_owner)
  end
end
