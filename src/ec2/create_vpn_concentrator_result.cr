private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateVpnConcentratorResult
    # Information about the VPN concentrator.
    property vpn_concentrator : VpnConcentrator | Nil

    def initialize(
      @vpn_concentrator : VpnConcentrator | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @vpn_concentrator
        params.concat(value.to_query_params("#{prefix}VpnConcentrator."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpn_concentrator: node.xpath_node("*[local-name()='vpnConcentrator']").try { |n| VpnConcentrator.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @vpn_concentrator
        value.validate!
      end
    end

    def_equals_and_hash(@vpn_concentrator)
  end
end
