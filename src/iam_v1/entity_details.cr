private alias Core = Amazonite::Core

module Amazonite::IamV1
  class EntityDetails
    property entity_info : EntityInfo

    property last_authenticated : Time | Nil

    def initialize(
      @entity_info : EntityInfo,
      @last_authenticated : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params.concat(@entity_info.to_query_params("#{prefix}EntityInfo."))

      if value = @last_authenticated
        params << {"#{prefix}LastAuthenticated", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        entity_info: node.xpath_node("*[local-name()='EntityInfo']").try { |n| EntityInfo.from_xml(n) }.not_nil!,
        last_authenticated: Core::XMLValue.time(node.xpath_node("*[local-name()='LastAuthenticated']")),
      )
    end
  end
end
