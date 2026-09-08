private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the placement group support of the instance type.
  class PlacementGroupInfo
    # The supported placement group types.
    property supported_strategies : Array(PlacementGroupStrategy) | Nil

    def initialize(
      @supported_strategies : Array(PlacementGroupStrategy) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@supported_strategies || [] of PlacementGroupStrategy).each_with_index(1) do |item, i|
        params << {"#{prefix}SupportedStrategies.#{i}", item.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        supported_strategies: node.xpath_nodes("*[local-name()='supportedStrategies']/*[local-name()='item']").compact_map { |n| AEC::PlacementGroupStrategy.from_json_object_key?(n.content) },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@supported_strategies)
  end
end
