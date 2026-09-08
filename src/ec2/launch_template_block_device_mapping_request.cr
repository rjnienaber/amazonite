private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a block device mapping.
  class LaunchTemplateBlockDeviceMappingRequest
    # The device name (for example, /dev/sdh or xvdh).
    property device_name : String | Nil

    # The virtual device name (ephemeralN). Instance store volumes are numbered starting from 0. An
    # instance type with 2 available instance store volumes can specify mappings for ephemeral0 and
    # ephemeral1. The number of available instance store volumes depends on the instance type. After
    # you connect to the instance, you must mount the volume.
    property virtual_name : String | Nil

    # Parameters used to automatically set up EBS volumes when the instance is launched.
    property ebs : LaunchTemplateEbsBlockDeviceRequest | Nil

    # To omit the device from the block device mapping, specify an empty string.
    property no_device : String | Nil

    def initialize(
      @device_name : String | Nil = nil,
      @virtual_name : String | Nil = nil,
      @ebs : LaunchTemplateEbsBlockDeviceRequest | Nil = nil,
      @no_device : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @device_name
        params << {"#{prefix}DeviceName", value}
      end

      if value = @virtual_name
        params << {"#{prefix}VirtualName", value}
      end

      if value = @ebs
        params.concat(value.to_query_params("#{prefix}Ebs."))
      end

      if value = @no_device
        params << {"#{prefix}NoDevice", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        device_name: Core::XMLValue.string(node.xpath_node("*[local-name()='DeviceName']")),
        virtual_name: Core::XMLValue.string(node.xpath_node("*[local-name()='VirtualName']")),
        ebs: node.xpath_node("*[local-name()='Ebs']").try { |n| LaunchTemplateEbsBlockDeviceRequest.from_xml(n) },
        no_device: Core::XMLValue.string(node.xpath_node("*[local-name()='NoDevice']")),
      )
    end

    def validate! : Nil
      if value = @ebs
        value.validate!
      end
    end

    def_equals_and_hash(@device_name, @virtual_name, @ebs, @no_device)
  end
end
