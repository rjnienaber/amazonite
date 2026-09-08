private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribePlacementGroupsResult
    # Information about the placement groups.
    property placement_groups : Array(PlacementGroup) | Nil

    def initialize(
      @placement_groups : Array(PlacementGroup) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@placement_groups || [] of PlacementGroup).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PlacementGroupSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        placement_groups: node.xpath_nodes("*[local-name()='placementGroupSet']/*[local-name()='item']").map { |n| PlacementGroup.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @placement_groups
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@placement_groups)
  end
end
