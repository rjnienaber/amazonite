private alias Core = Amazonite::Core

module Amazonite::IamV1
  class DeleteVirtualMFADeviceRequest
    property serial_number : String

    def initialize(
      @serial_number : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}SerialNumber", @serial_number}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        serial_number: Core::XMLValue.string(node.xpath_node("*[local-name()='SerialNumber']")).not_nil!,
      )
    end
  end
end
