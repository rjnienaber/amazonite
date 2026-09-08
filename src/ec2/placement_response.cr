private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the placement of an instance.
  class PlacementResponse
    # The name of the placement group that the instance is in.
    property group_name : String | Nil

    def initialize(
      @group_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @group_name
        params << {"#{prefix}GroupName", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='groupName']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@group_name)
  end
end
