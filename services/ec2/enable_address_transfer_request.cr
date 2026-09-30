private alias Core = Amazonite::Core

module Amazonite::EC2
  class EnableAddressTransferRequest
    # The allocation ID of an Elastic IP address.
    property allocation_id : String

    # The ID of the account that you want to transfer the Elastic IP address to.
    property transfer_account_id : String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @allocation_id : String,
      @transfer_account_id : String,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}AllocationId", @allocation_id}

      params << {"#{prefix}TransferAccountId", @transfer_account_id}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        allocation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AllocationId']")).not_nil!,
        transfer_account_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransferAccountId']")).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@allocation_id, @transfer_account_id, @dry_run)
  end
end
