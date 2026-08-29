private alias Core = Amazonite::Core

module Amazonite::IamV1
  class EnableOutboundWebIdentityFederationResponse
    property issuer_identifier : String | Nil

    def initialize(
      @issuer_identifier : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @issuer_identifier
        params << {"#{prefix}IssuerIdentifier", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        issuer_identifier: Core::XMLValue.string(node.xpath_node("*[local-name()='IssuerIdentifier']")),
      )
    end
  end
end
