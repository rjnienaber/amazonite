private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a block device mapping, which defines the EBS volumes and instance store volumes to
  # attach to an instance at launch.
  class BlockDeviceMapping
    # Parameters used to automatically set up EBS volumes when the instance is launched.
    property ebs : EbsBlockDevice | Nil

    # To omit the device from the block device mapping, specify an empty string. When this property is
    # specified, the device is removed from the block device mapping regardless of the assigned value.
    property no_device : String | Nil

    # The device name. For available device names, see [Device names for
    # volumes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/device_naming.html).
    property device_name : String | Nil

    # The virtual device name (`ephemeral`N). Instance store volumes are numbered starting from 0. An
    # instance type with 2 available instance store volumes can specify mappings for `ephemeral0` and
    # `ephemeral1`. The number of available instance store volumes depends on the instance type. After
    # you connect to the instance, you must mount the volume.
    #
    # NVMe instance store volumes are automatically enumerated and assigned a device name. Including
    # them in your block device mapping has no effect.
    #
    # Constraints: For M3 instances, you must specify instance store volumes in the block device
    # mapping for the instance. When you launch an M3 instance, we ignore any instance store volumes
    # specified in the block device mapping for the AMI.
    property virtual_name : String | Nil

    def initialize(
      @ebs : EbsBlockDevice | Nil = nil,
      @no_device : String | Nil = nil,
      @device_name : String | Nil = nil,
      @virtual_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ebs
        params.concat(value.to_query_params("#{prefix}Ebs."))
      end

      if value = @no_device
        params << {"#{prefix}NoDevice", value}
      end

      if value = @device_name
        params << {"#{prefix}DeviceName", value}
      end

      if value = @virtual_name
        params << {"#{prefix}VirtualName", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ebs: node.xpath_node("*[local-name()='ebs']").try { |n| EbsBlockDevice.from_xml(n) },
        no_device: Core::XMLValue.string(node.xpath_node("*[local-name()='noDevice']")),
        device_name: Core::XMLValue.string(node.xpath_node("*[local-name()='deviceName']")),
        virtual_name: Core::XMLValue.string(node.xpath_node("*[local-name()='virtualName']")),
      )
    end

    def validate! : Nil
      if value = @ebs
        value.validate!
      end
    end

    def_equals_and_hash(@ebs, @no_device, @device_name, @virtual_name)
  end
end
