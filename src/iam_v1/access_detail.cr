private alias Core = Amazonite::Core

module Amazonite::IamV1
  class AccessDetail
    property service_name : String

    property service_namespace : String

    property region : String | Nil

    property entity_path : String | Nil

    property last_authenticated_time : Time | Nil

    property total_authenticated_entities : Int32 | Nil

    def initialize(
      @service_name : String,
      @service_namespace : String,
      @region : String | Nil = nil,
      @entity_path : String | Nil = nil,
      @last_authenticated_time : Time | Nil = nil,
      @total_authenticated_entities : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ServiceName", @service_name}

      params << {"#{prefix}ServiceNamespace", @service_namespace}

      if value = @region
        params << {"#{prefix}Region", value}
      end

      if value = @entity_path
        params << {"#{prefix}EntityPath", value}
      end

      if value = @last_authenticated_time
        params << {"#{prefix}LastAuthenticatedTime", Core::QueryValue.time(value)}
      end

      if value = @total_authenticated_entities
        params << {"#{prefix}TotalAuthenticatedEntities", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        service_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceName']")).not_nil!,
        service_namespace: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceNamespace']")).not_nil!,
        region: Core::XMLValue.string(node.xpath_node("*[local-name()='Region']")),
        entity_path: Core::XMLValue.string(node.xpath_node("*[local-name()='EntityPath']")),
        last_authenticated_time: Core::XMLValue.time(node.xpath_node("*[local-name()='LastAuthenticatedTime']")),
        total_authenticated_entities: Core::XMLValue.i32(node.xpath_node("*[local-name()='TotalAuthenticatedEntities']")),
      )
    end
  end
end
