private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a block device mapping, which defines the EBS volumes and instance store volumes to
  # attach to an instance at launch.
  class BlockDeviceMappingResponse
    # The device name (for example, `/dev/sdh` or `xvdh`).
    property device_name : String | Nil

    # The virtual device name.
    property virtual_name : String | Nil

    # Parameters used to automatically set up EBS volumes when the instance is launched.
    property ebs : EbsBlockDeviceResponse | Nil

    # Suppresses the specified device included in the block device mapping.
    property no_device : String | Nil

    def initialize(
      @device_name : String | Nil = nil,
      @virtual_name : String | Nil = nil,
      @ebs : EbsBlockDeviceResponse | Nil = nil,
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
        ebs: node.xpath_node("*[local-name()='ebs']").try { |n| EbsBlockDeviceResponse.from_xml(n) },
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
