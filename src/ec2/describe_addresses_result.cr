private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeAddressesResult
    # Information about the Elastic IP addresses.
    property addresses : Array(Address) | Nil

    def initialize(
      @addresses : Array(Address) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@addresses || [] of Address).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AddressesSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        addresses: node.xpath_nodes("*[local-name()='addressesSet']/*[local-name()='item']").map { |n| Address.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @addresses
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@addresses)
  end
end
