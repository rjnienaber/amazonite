private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an additional key exchange round that is permitted for the VPN tunnel.
  class VpnAdditionalKeyExchange
    # The additional key exchange round number.
    property additional_key_exchange_round : Int32 | Nil

    # The key exchange method numbers permitted for this round.
    property key_exchange_methods : Array(AdditionalKeyExchangeMethodsListValue) | Nil

    # Indicates whether this round is mandatory.
    property requirement : AdditionalKeyExchangeRequirement | Nil

    def initialize(
      @additional_key_exchange_round : Int32 | Nil = nil,
      @key_exchange_methods : Array(AdditionalKeyExchangeMethodsListValue) | Nil = nil,
      @requirement : AdditionalKeyExchangeRequirement | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @additional_key_exchange_round
        params << {"#{prefix}AdditionalKeyExchangeRound", value.to_s}
      end

      (@key_exchange_methods || [] of AdditionalKeyExchangeMethodsListValue).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}KeyExchangeMethodSet.#{i}."))
      end

      if value = @requirement
        params << {"#{prefix}Requirement", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        additional_key_exchange_round: Core::XMLValue.i32(node.xpath_node("*[local-name()='additionalKeyExchangeRound']")),
        key_exchange_methods: node.xpath_nodes("*[local-name()='keyExchangeMethodSet']/*[local-name()='item']").map { |n| AdditionalKeyExchangeMethodsListValue.from_xml(n) },
        requirement: (n = node.xpath_node("*[local-name()='requirement']")) ? AEC::AdditionalKeyExchangeRequirement.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @key_exchange_methods
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@additional_key_exchange_round, @key_exchange_methods, @requirement)
  end
end
