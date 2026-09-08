private alias Core = Amazonite::Core

module Amazonite::EC2
  class AdvertiseByoipCidrResult
    # Information about the address range.
    property byoip_cidr : ByoipCidr | Nil

    def initialize(
      @byoip_cidr : ByoipCidr | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @byoip_cidr
        params.concat(value.to_query_params("#{prefix}ByoipCidr."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        byoip_cidr: node.xpath_node("*[local-name()='byoipCidr']").try { |n| ByoipCidr.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @byoip_cidr
        value.validate!
      end
    end

    def_equals_and_hash(@byoip_cidr)
  end
end
