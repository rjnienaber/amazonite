private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The Autonomous System Number (ASN) and BYOIP CIDR association.
  class Byoasn
    # A public 2-byte or 4-byte ASN.
    property asn : String | Nil

    # An IPAM ID.
    property ipam_id : String | Nil

    # The status message.
    property status_message : String | Nil

    # The provisioning state of the BYOASN.
    property state : AsnState | Nil

    def initialize(
      @asn : String | Nil = nil,
      @ipam_id : String | Nil = nil,
      @status_message : String | Nil = nil,
      @state : AsnState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @asn
        params << {"#{prefix}Asn", value}
      end

      if value = @ipam_id
        params << {"#{prefix}IpamId", value}
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
        ipam_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamId']")),
        status_message: Core::XMLValue.string(node.xpath_node("*[local-name()='statusMessage']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::AsnState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@asn, @ipam_id, @status_message, @state)
  end
end
