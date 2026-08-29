private alias Core = Amazonite::Core

module Amazonite::IamV1
  class RoleLastUsed
    property last_used_date : Time | Nil

    property region : String | Nil

    def initialize(
      @last_used_date : Time | Nil = nil,
      @region : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @last_used_date
        params << {"#{prefix}LastUsedDate", Core::QueryValue.time(value)}
      end

      if value = @region
        params << {"#{prefix}Region", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        last_used_date: Core::XMLValue.time(node.xpath_node("*[local-name()='LastUsedDate']")),
        region: Core::XMLValue.string(node.xpath_node("*[local-name()='Region']")),
      )
    end
  end
end
