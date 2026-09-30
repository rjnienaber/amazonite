private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateSecondaryNetworkResult
    # Information about the secondary network.
    property secondary_network : SecondaryNetwork | Nil

    # Unique, case-sensitive identifier to ensure the idempotency of the request. Only returned if a
    # client token was provided in the request.
    property client_token : String | Nil

    def initialize(
      @secondary_network : SecondaryNetwork | Nil = nil,
      @client_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @secondary_network
        params.concat(value.to_query_params("#{prefix}SecondaryNetwork."))
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        secondary_network: node.xpath_node("*[local-name()='secondaryNetwork']").try { |n| SecondaryNetwork.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='clientToken']")),
      )
    end

    def validate! : Nil
      if value = @secondary_network
        value.validate!
      end
    end

    def_equals_and_hash(@secondary_network, @client_token)
  end
end
