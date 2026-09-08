private alias Core = Amazonite::Core

module Amazonite::EC2
  # Specifies the encryption algorithm for the VPN tunnel for phase 2 IKE negotiations.
  class Phase2EncryptionAlgorithmsRequestListValue
    # The encryption algorithm.
    property value : String | Nil

    def initialize(
      @value : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @value
        params << {"#{prefix}Value", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        value: Core::XMLValue.string(node.xpath_node("*[local-name()='Value']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@value)
  end
end
