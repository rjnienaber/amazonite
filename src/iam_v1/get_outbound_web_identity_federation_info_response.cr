private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetOutboundWebIdentityFederationInfoResponse
    property issuer_identifier : String | Nil

    property jwt_vending_enabled : Bool | Nil

    def initialize(
      @issuer_identifier : String | Nil = nil,
      @jwt_vending_enabled : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @issuer_identifier
        params << {"#{prefix}IssuerIdentifier", value}
      end

      if value = @jwt_vending_enabled
        params << {"#{prefix}JwtVendingEnabled", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        issuer_identifier: Core::XMLValue.string(node.xpath_node("*[local-name()='IssuerIdentifier']")),
        jwt_vending_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='JwtVendingEnabled']")),
      )
    end
  end
end
