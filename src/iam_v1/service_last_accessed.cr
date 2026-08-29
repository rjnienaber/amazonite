private alias Core = Amazonite::Core

module Amazonite::IamV1
  class ServiceLastAccessed
    property service_name : String

    property last_authenticated : Time | Nil

    property service_namespace : String

    property last_authenticated_entity : String | Nil

    property last_authenticated_region : String | Nil

    property total_authenticated_entities : Int32 | Nil

    property tracked_actions_last_accessed : Array(TrackedActionLastAccessed) | Nil

    def initialize(
      @service_name : String,
      @service_namespace : String,
      @last_authenticated : Time | Nil = nil,
      @last_authenticated_entity : String | Nil = nil,
      @last_authenticated_region : String | Nil = nil,
      @total_authenticated_entities : Int32 | Nil = nil,
      @tracked_actions_last_accessed : Array(TrackedActionLastAccessed) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ServiceName", @service_name}

      if value = @last_authenticated
        params << {"#{prefix}LastAuthenticated", Core::QueryValue.time(value)}
      end

      params << {"#{prefix}ServiceNamespace", @service_namespace}

      if value = @last_authenticated_entity
        params << {"#{prefix}LastAuthenticatedEntity", value}
      end

      if value = @last_authenticated_region
        params << {"#{prefix}LastAuthenticatedRegion", value}
      end

      if value = @total_authenticated_entities
        params << {"#{prefix}TotalAuthenticatedEntities", value.to_s}
      end

      (@tracked_actions_last_accessed || [] of TrackedActionLastAccessed).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TrackedActionsLastAccessed.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        service_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceName']")).not_nil!,
        last_authenticated: Core::XMLValue.time(node.xpath_node("*[local-name()='LastAuthenticated']")),
        service_namespace: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceNamespace']")).not_nil!,
        last_authenticated_entity: Core::XMLValue.string(node.xpath_node("*[local-name()='LastAuthenticatedEntity']")),
        last_authenticated_region: Core::XMLValue.string(node.xpath_node("*[local-name()='LastAuthenticatedRegion']")),
        total_authenticated_entities: Core::XMLValue.i32(node.xpath_node("*[local-name()='TotalAuthenticatedEntities']")),
        tracked_actions_last_accessed: node.xpath_nodes("*[local-name()='TrackedActionsLastAccessed']/*[local-name()='member']").map { |n| TrackedActionLastAccessed.from_xml(n) },
      )
    end
  end
end
