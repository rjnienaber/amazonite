private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a block device mapping.
  class LaunchTemplateBlockDeviceMapping
    # The device name.
    property device_name : String | Nil

    # The virtual device name (ephemeralN).
    property virtual_name : String | Nil

    # Information about the block device for an EBS volume.
    property ebs : LaunchTemplateEbsBlockDevice | Nil

    # To omit the device from the block device mapping, specify an empty string.
    property no_device : String | Nil

    def initialize(
      @device_name : String | Nil = nil,
      @virtual_name : String | Nil = nil,
      @ebs : LaunchTemplateEbsBlockDevice | Nil = nil,
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
        device_name: Core::XMLValue.string(node.xpath_node("*[local-name()='deviceName']")),
        virtual_name: Core::XMLValue.string(node.xpath_node("*[local-name()='virtualName']")),
        ebs: node.xpath_node("*[local-name()='ebs']").try { |n| LaunchTemplateEbsBlockDevice.from_xml(n) },
        no_device: Core::XMLValue.string(node.xpath_node("*[local-name()='noDevice']")),
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
