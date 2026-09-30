private alias Core = Amazonite::Core

module Amazonite::EC2
  class ProvisionIpamByoasnResult
    # An ASN and BYOIP CIDR association.
    property byoasn : Byoasn | Nil

    def initialize(
      @byoasn : Byoasn | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @byoasn
        params.concat(value.to_query_params("#{prefix}Byoasn."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        byoasn: node.xpath_node("*[local-name()='byoasn']").try { |n| Byoasn.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @byoasn
        value.validate!
      end
    end

    def_equals_and_hash(@byoasn)
  end
end
