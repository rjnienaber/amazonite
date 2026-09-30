private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # An Autonomous System Number (ASN) and BYOIP CIDR association.
  class AsnAssociation
    # The association's ASN.
    property asn : String | Nil

    # The association's CIDR.
    property cidr : String | Nil

    # The association's status message.
    property status_message : String | Nil

    # The association's state.
    property state : AsnAssociationState | Nil

    def initialize(
      @asn : String | Nil = nil,
      @cidr : String | Nil = nil,
      @status_message : String | Nil = nil,
      @state : AsnAssociationState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @asn
        params << {"#{prefix}Asn", value}
      end

      if value = @cidr
        params << {"#{prefix}Cidr", value}
      end

      if value = @status_message
        params << {"#{prefix}StatusMessage", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        asn: Core::XMLValue.string(node.xpath_node("*[local-name()='asn']")),
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='cidr']")),
        status_message: Core::XMLValue.string(node.xpath_node("*[local-name()='statusMessage']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::AsnAssociationState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@asn, @cidr, @status_message, @state)
  end
end
