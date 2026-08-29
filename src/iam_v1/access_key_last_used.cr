private alias Core = Amazonite::Core

module Amazonite::IamV1
  class AccessKeyLastUsed
    property last_used_date : Time | Nil

    property service_name : String

    property region : String

    def initialize(
      @service_name : String,
      @region : String,
      @last_used_date : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @last_used_date
        params << {"#{prefix}LastUsedDate", Core::QueryValue.time(value)}
      end

      params << {"#{prefix}ServiceName", @service_name}

      params << {"#{prefix}Region", @region}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        last_used_date: Core::XMLValue.time(node.xpath_node("*[local-name()='LastUsedDate']")),
        service_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceName']")).not_nil!,
        region: Core::XMLValue.string(node.xpath_node("*[local-name()='Region']")).not_nil!,
      )
    end
  end
end
