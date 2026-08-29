module Amazonite::IamV1
  class CreateVirtualMFADeviceResponse
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
  end
end
