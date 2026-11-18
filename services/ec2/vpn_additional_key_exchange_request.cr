private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Specifies an additional key exchange round for the VPN tunnel, as defined in RFC 9370.
  class VpnAdditionalKeyExchangeRequest
    # The additional key exchange round number.
    #
    # Valid range: Minimum value of 1. Maximum value of 7.
    property additional_key_exchange_round : Int32

    # The key exchange method numbers that are permitted for this round. The method numbers are the
    # IANA IKEv2 key exchange method transform IDs.
    #
    # A `required` round must specify at least one method. An `optional` round can omit this parameter
    # or specify an empty list. If omitted or empty for an optional round, the round is disabled.
    #
    # IKEv2 requires that the initial Diffie-Hellman exchange and each required round use a different
    # key exchange method. The permitted methods must allow a distinct method to be selected for each
    # of them.
    #
    # Valid values: `2` | `5` | `14` | `15` | `16` | `17` | `18` | `19` | `20` | `21` | `22` | `23` |
    # `24` | `35` | `36` | `37`
    property key_exchange_methods : Array(AdditionalKeyExchangeMethodsRequestListValue) | Nil

    # Indicates whether this round is mandatory. If `required`, the tunnel isn't established unless
    # the customer gateway device negotiates this round. If `optional`, the round is negotiated only
    # if the customer gateway device supports it.
    #
    # Valid values: `required` | `optional`
    #
    # Default: `required`
    property requirement : AdditionalKeyExchangeRequirement | Nil

    def initialize(
      @additional_key_exchange_round : Int32,
      @key_exchange_methods : Array(AdditionalKeyExchangeMethodsRequestListValue) | Nil = nil,
      @requirement : AdditionalKeyExchangeRequirement | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}AdditionalKeyExchangeRound", @additional_key_exchange_round.to_s}

      (@key_exchange_methods || [] of AdditionalKeyExchangeMethodsRequestListValue).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}KeyExchangeMethod.#{i}."))
      end

      if value = @requirement
        params << {"#{prefix}Requirement", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        additional_key_exchange_round: Core::XMLValue.i32(node.xpath_node("*[local-name()='AdditionalKeyExchangeRound']")).not_nil!,
        key_exchange_methods: node.xpath_nodes("*[local-name()='KeyExchangeMethod']/*[local-name()='item']").map { |n| AdditionalKeyExchangeMethodsRequestListValue.from_xml(n) },
        requirement: (n = node.xpath_node("*[local-name()='Requirement']")) ? AEC::AdditionalKeyExchangeRequirement.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @additional_key_exchange_round
        raise Core::ValidationError.new("AdditionalKeyExchangeRound value must be >= 1") if value < 1
        raise Core::ValidationError.new("AdditionalKeyExchangeRound value must be <= 7") if value > 7
      end

      if value = @key_exchange_methods
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@additional_key_exchange_round, @key_exchange_methods, @requirement)
  end
end
