private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreatePlacementGroupResult
    # Information about the placement group.
    property placement_group : PlacementGroup | Nil

    def initialize(
      @placement_group : PlacementGroup | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @placement_group
        params.concat(value.to_query_params("#{prefix}PlacementGroup."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        placement_group: node.xpath_node("*[local-name()='placementGroup']").try { |n| PlacementGroup.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @placement_group
        value.validate!
      end
    end

    def_equals_and_hash(@placement_group)
  end
end
