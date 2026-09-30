private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Details on the Elastic IP address transfer. For more information, see [Transfer Elastic IP
  # addresses](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-eips.html#transfer-EIPs-intro)
  # in the *Amazon VPC User Guide*.
  class AddressTransfer
    # The Elastic IP address being transferred.
    property public_ip : String | Nil

    # The allocation ID of an Elastic IP address.
    property allocation_id : String | Nil

    # The ID of the account that you want to transfer the Elastic IP address to.
    property transfer_account_id : String | Nil

    # The timestamp when the Elastic IP address transfer expired. When the source account starts the
    # transfer, the transfer account has seven hours to allocate the Elastic IP address to complete
    # the transfer, or the Elastic IP address will return to its original owner.
    property transfer_offer_expiration_timestamp : Time | Nil

    # The timestamp when the Elastic IP address transfer was accepted.
    property transfer_offer_accepted_timestamp : Time | Nil

    # The Elastic IP address transfer status.
    property address_transfer_status : AddressTransferStatus | Nil

    def initialize(
      @public_ip : String | Nil = nil,
      @allocation_id : String | Nil = nil,
      @transfer_account_id : String | Nil = nil,
      @transfer_offer_expiration_timestamp : Time | Nil = nil,
      @transfer_offer_accepted_timestamp : Time | Nil = nil,
      @address_transfer_status : AddressTransferStatus | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @public_ip
        params << {"#{prefix}PublicIp", value}
      end

      if value = @allocation_id
        params << {"#{prefix}AllocationId", value}
      end

      if value = @transfer_account_id
        params << {"#{prefix}TransferAccountId", value}
      end

      if value = @transfer_offer_expiration_timestamp
        params << {"#{prefix}TransferOfferExpirationTimestamp", Core::QueryValue.time(value)}
      end

      if value = @transfer_offer_accepted_timestamp
        params << {"#{prefix}TransferOfferAcceptedTimestamp", Core::QueryValue.time(value)}
      end

      if value = @address_transfer_status
        params << {"#{prefix}AddressTransferStatus", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        public_ip: Core::XMLValue.string(node.xpath_node("*[local-name()='publicIp']")),
        allocation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='allocationId']")),
        transfer_account_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transferAccountId']")),
        transfer_offer_expiration_timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='transferOfferExpirationTimestamp']")),
        transfer_offer_accepted_timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='transferOfferAcceptedTimestamp']")),
        address_transfer_status: (n = node.xpath_node("*[local-name()='addressTransferStatus']")) ? AEC::AddressTransferStatus.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@public_ip, @allocation_id, @transfer_account_id, @transfer_offer_expiration_timestamp, @transfer_offer_accepted_timestamp, @address_transfer_status)
  end
end
