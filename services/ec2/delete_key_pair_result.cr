private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteKeyPairResult
    # Is `true` if the request succeeds, and an error otherwise.
    property return : Bool | Nil

    # The ID of the key pair.
    property key_pair_id : String | Nil

    def initialize(
      @return : Bool | Nil = nil,
      @key_pair_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @return
        params << {"#{prefix}Return", Core::QueryValue.bool(value)}
      end

      if value = @key_pair_id
        params << {"#{prefix}KeyPairId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        return: Core::XMLValue.bool(node.xpath_node("*[local-name()='return']")),
        key_pair_id: Core::XMLValue.string(node.xpath_node("*[local-name()='keyPairId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@return, @key_pair_id)
  end
end
