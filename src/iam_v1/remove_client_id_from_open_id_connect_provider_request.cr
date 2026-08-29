private alias Core = Amazonite::Core

module Amazonite::IamV1
  class RemoveClientIDFromOpenIDConnectProviderRequest
    property open_id_connect_provider_arn : String

    property client_id : String

    def initialize(
      @open_id_connect_provider_arn : String,
      @client_id : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}OpenIDConnectProviderArn", @open_id_connect_provider_arn}

      params << {"#{prefix}ClientID", @client_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        open_id_connect_provider_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='OpenIDConnectProviderArn']")).not_nil!,
        client_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientID']")).not_nil!,
      )
    end
  end
end
