private alias Core = Amazonite::Core

module Amazonite::Iam
  # Contains the response to a successful
  # [CreateVirtualMFADevice](https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateVirtualMFADevice.html)
  # request.
  class CreateVirtualMFADeviceResponse
    # A structure containing details about the new virtual MFA device.
    property virtual_mfa_device : VirtualMFADevice

    def initialize(
      @virtual_mfa_device : VirtualMFADevice,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params.concat(@virtual_mfa_device.to_query_params("#{prefix}VirtualMFADevice."))
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        virtual_mfa_device: node.xpath_node("*[local-name()='VirtualMFADevice']").try { |n| VirtualMFADevice.from_xml(n) }.not_nil!,
      )
    end

    def validate! : Nil
      if value = @virtual_mfa_device
        value.validate!
      end
    end

    def_equals_and_hash(@virtual_mfa_device)
  end
end
