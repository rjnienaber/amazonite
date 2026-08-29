private alias Core = Amazonite::Core

module Amazonite::IamV1
  class SAMLPrivateKey
    property key_id : String | Nil

    property timestamp : Time | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @timestamp : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @key_id
        params << {"#{prefix}KeyId", value}
      end

      if value = @timestamp
        params << {"#{prefix}Timestamp", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='KeyId']")),
        timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='Timestamp']")),
      )
    end
  end
end
