private alias Core = Amazonite::Core

module Amazonite::EC2
  class DisassociateIpamByoasnResult
    # An ASN and BYOIP CIDR association.
    property asn_association : AsnAssociation | Nil

    def initialize(
      @asn_association : AsnAssociation | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @asn_association
        params.concat(value.to_query_params("#{prefix}AsnAssociation."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        asn_association: node.xpath_node("*[local-name()='asnAssociation']").try { |n| AsnAssociation.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @asn_association
        value.validate!
      end
    end

    def_equals_and_hash(@asn_association)
  end
end
