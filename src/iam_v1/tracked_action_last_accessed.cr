private alias Core = Amazonite::Core

module Amazonite::IamV1
  class TrackedActionLastAccessed
    property action_name : String | Nil

    property last_accessed_entity : String | Nil

    property last_accessed_time : Time | Nil

    property last_accessed_region : String | Nil

    def initialize(
      @action_name : String | Nil = nil,
      @last_accessed_entity : String | Nil = nil,
      @last_accessed_time : Time | Nil = nil,
      @last_accessed_region : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @action_name
        params << {"#{prefix}ActionName", value}
      end

      if value = @last_accessed_entity
        params << {"#{prefix}LastAccessedEntity", value}
      end

      if value = @last_accessed_time
        params << {"#{prefix}LastAccessedTime", Core::QueryValue.time(value)}
      end

      if value = @last_accessed_region
        params << {"#{prefix}LastAccessedRegion", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        action_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ActionName']")),
        last_accessed_entity: Core::XMLValue.string(node.xpath_node("*[local-name()='LastAccessedEntity']")),
        last_accessed_time: Core::XMLValue.time(node.xpath_node("*[local-name()='LastAccessedTime']")),
        last_accessed_region: Core::XMLValue.string(node.xpath_node("*[local-name()='LastAccessedRegion']")),
      )
    end
  end
end
