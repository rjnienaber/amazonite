private alias Core = Amazonite::Core

module Amazonite::EC2
  class DisableAddressTransferResult
    # An Elastic IP address transfer.
    property address_transfer : AddressTransfer | Nil

    def initialize(
      @address_transfer : AddressTransfer | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @address_transfer
        params.concat(value.to_query_params("#{prefix}AddressTransfer."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        address_transfer: node.xpath_node("*[local-name()='addressTransfer']").try { |n| AddressTransfer.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @address_transfer
        value.validate!
      end
    end

    def_equals_and_hash(@address_transfer)
  end
end
