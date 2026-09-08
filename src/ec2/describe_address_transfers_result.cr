private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeAddressTransfersResult
    # The Elastic IP address transfer.
    property address_transfers : Array(AddressTransfer) | Nil

    # Specify the pagination token from a previous request to retrieve the next page of results.
    property next_token : String | Nil

    def initialize(
      @address_transfers : Array(AddressTransfer) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@address_transfers || [] of AddressTransfer).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AddressTransferSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        address_transfers: node.xpath_nodes("*[local-name()='addressTransferSet']/*[local-name()='item']").map { |n| AddressTransfer.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @address_transfers
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@address_transfers, @next_token)
  end
end
