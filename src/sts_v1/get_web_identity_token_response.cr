private alias Core = Amazonite::Core

module Amazonite::StsV1
  class GetWebIdentityTokenResponse
    property web_identity_token : String | Nil

    property expiration : Time | Nil

    def initialize(
      @web_identity_token : String | Nil = nil,
      @expiration : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @web_identity_token
        params << {"#{prefix}WebIdentityToken", value}
      end

      if value = @expiration
        params << {"#{prefix}Expiration", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        web_identity_token: Core::XMLValue.string(node.xpath_node("*[local-name()='WebIdentityToken']")),
        expiration: Core::XMLValue.time(node.xpath_node("*[local-name()='Expiration']")),
      )
    end
  end
end
