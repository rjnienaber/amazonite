private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a block device mapping entry.
  class InstanceBlockDeviceMappingSpecification
    # The device name. For available device names, see [Device names for
    # volumes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/device_naming.html).
    property device_name : String | Nil

    # Parameters used to automatically set up EBS volumes when the instance is launched.
    property ebs : EbsInstanceBlockDeviceSpecification | Nil

    # The virtual device name.
    property virtual_name : String | Nil

    # Suppresses the specified device included in the block device mapping.
    property no_device : String | Nil

    def initialize(
      @device_name : String | Nil = nil,
      @ebs : EbsInstanceBlockDeviceSpecification | Nil = nil,
      @virtual_name : String | Nil = nil,
      @no_device : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @device_name
        params << {"#{prefix}DeviceName", value}
      end

      if value = @ebs
        params.concat(value.to_query_params("#{prefix}Ebs."))
      end

      if value = @virtual_name
        params << {"#{prefix}VirtualName", value}
      end

      if value = @no_device
        params << {"#{prefix}NoDevice", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        device_name: Core::XMLValue.string(node.xpath_node("*[local-name()='deviceName']")),
        ebs: node.xpath_node("*[local-name()='ebs']").try { |n| EbsInstanceBlockDeviceSpecification.from_xml(n) },
        virtual_name: Core::XMLValue.string(node.xpath_node("*[local-name()='virtualName']")),
        no_device: Core::XMLValue.string(node.xpath_node("*[local-name()='noDevice']")),
      )
    end

    def validate! : Nil
      if value = @ebs
        value.validate!
      end
    end

    def_equals_and_hash(@device_name, @ebs, @virtual_name, @no_device)
  end
end
