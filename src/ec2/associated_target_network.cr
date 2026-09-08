private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a target network that is associated with a Client VPN endpoint. A target network is a
  # subnet in a VPC.
  class AssociatedTargetNetwork
    # The ID of the subnet.
    property network_id : String | Nil

    # The target network type.
    property network_type : AssociatedNetworkType | Nil

    def initialize(
      @network_id : String | Nil = nil,
      @network_type : AssociatedNetworkType | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @network_id
        params << {"#{prefix}NetworkId", value}
      end

      if value = @network_type
        params << {"#{prefix}NetworkType", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkId']")),
        network_type: (n = node.xpath_node("*[local-name()='networkType']")) ? AEC::AssociatedNetworkType.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@network_id, @network_type)
  end
end
