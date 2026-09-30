private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyAccountVpcEncryptionControlResult
    # Information about the account-level VPC Encryption Control configuration.
    property account_vpc_encryption_control : AccountVpcEncryptionControl | Nil

    def initialize(
      @account_vpc_encryption_control : AccountVpcEncryptionControl | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @account_vpc_encryption_control
        params.concat(value.to_query_params("#{prefix}AccountVpcEncryptionControl."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        account_vpc_encryption_control: node.xpath_node("*[local-name()='accountVpcEncryptionControl']").try { |n| AccountVpcEncryptionControl.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @account_vpc_encryption_control
        value.validate!
      end
    end

    def_equals_and_hash(@account_vpc_encryption_control)
  end
end
