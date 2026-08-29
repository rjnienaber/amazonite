private alias Core = Amazonite::Core

module Amazonite::IamV1
  class DeleteOpenIDConnectProviderRequest
    property open_id_connect_provider_arn : String

    def initialize(
      @open_id_connect_provider_arn : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}OpenIDConnectProviderArn", @open_id_connect_provider_arn}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        open_id_connect_provider_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='OpenIDConnectProviderArn']")).not_nil!,
      )
    end
  end
end
