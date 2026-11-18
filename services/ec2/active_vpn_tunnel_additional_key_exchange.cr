private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an additional key exchange round negotiated for an active VPN tunnel.
  class ActiveVpnTunnelAdditionalKeyExchange
    # The additional key exchange round number.
    property additional_key_exchange_round : Int32 | Nil

    # The key exchange method number negotiated for this round.
    property key_exchange_method : Int32 | Nil

    def initialize(
      @additional_key_exchange_round : Int32 | Nil = nil,
      @key_exchange_method : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @additional_key_exchange_round
        params << {"#{prefix}AdditionalKeyExchangeRound", value.to_s}
      end

      if value = @key_exchange_method
        params << {"#{prefix}KeyExchangeMethod", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        additional_key_exchange_round: Core::XMLValue.i32(node.xpath_node("*[local-name()='additionalKeyExchangeRound']")),
        key_exchange_method: Core::XMLValue.i32(node.xpath_node("*[local-name()='keyExchangeMethod']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@additional_key_exchange_round, @key_exchange_method)
  end
end
