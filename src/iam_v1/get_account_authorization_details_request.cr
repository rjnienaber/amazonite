private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetAccountAuthorizationDetailsRequest
    property filter : Array(EntityType) | Nil

    property max_items : Int32 | Nil

    property marker : String | Nil

    def initialize(
      @filter : Array(EntityType) | Nil = nil,
      @max_items : Int32 | Nil = nil,
      @marker : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@filter || [] of EntityType).each_with_index(1) do |item, i|
        params << {"#{prefix}Filter.member.#{i}", item.to_json_object_key}
      end

      if value = @max_items
        params << {"#{prefix}MaxItems", value.to_s}
      end

      if value = @marker
        params << {"#{prefix}Marker", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        filter: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='member']").compact_map { |n| AI::EntityType.from_json_object_key?(n.content) },
        max_items: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxItems']")),
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
      )
    end
  end
end
