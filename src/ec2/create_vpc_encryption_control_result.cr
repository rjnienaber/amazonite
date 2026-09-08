private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateVpcEncryptionControlResult
    # Information about the VPC Encryption Control configuration.
    property vpc_encryption_control : VpcEncryptionControl | Nil

    def initialize(
      @vpc_encryption_control : VpcEncryptionControl | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @vpc_encryption_control
        params.concat(value.to_query_params("#{prefix}VpcEncryptionControl."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpc_encryption_control: node.xpath_node("*[local-name()='vpcEncryptionControl']").try { |n| VpcEncryptionControl.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @vpc_encryption_control
        value.validate!
      end
    end

    def_equals_and_hash(@vpc_encryption_control)
  end
end
