private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyAddressAttributeResult
    # Information about the Elastic IP address.
    property address : AddressAttribute | Nil

    def initialize(
      @address : AddressAttribute | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @address
        params.concat(value.to_query_params("#{prefix}Address."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        address: node.xpath_node("*[local-name()='address']").try { |n| AddressAttribute.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @address
        value.validate!
      end
    end

    def_equals_and_hash(@address)
  end
end
