private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the data that identifies an Amazon FPGA image (AFI) on the PCI bus.
  class PciId
    # The ID of the device.
    property device_id : String | Nil

    # The ID of the vendor.
    property vendor_id : String | Nil

    # The ID of the subsystem.
    property subsystem_id : String | Nil

    # The ID of the vendor for the subsystem.
    property subsystem_vendor_id : String | Nil

    def initialize(
      @device_id : String | Nil = nil,
      @vendor_id : String | Nil = nil,
      @subsystem_id : String | Nil = nil,
      @subsystem_vendor_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @device_id
        params << {"#{prefix}DeviceId", value}
      end

      if value = @vendor_id
        params << {"#{prefix}VendorId", value}
      end

      if value = @subsystem_id
        params << {"#{prefix}SubsystemId", value}
      end

      if value = @subsystem_vendor_id
        params << {"#{prefix}SubsystemVendorId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        device_id: Core::XMLValue.string(node.xpath_node("*[local-name()='DeviceId']")),
        vendor_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VendorId']")),
        subsystem_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SubsystemId']")),
        subsystem_vendor_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SubsystemVendorId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@device_id, @vendor_id, @subsystem_id, @subsystem_vendor_id)
  end
end
