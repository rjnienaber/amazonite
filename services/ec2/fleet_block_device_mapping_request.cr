private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a block device mapping, which defines the EBS volumes and instance store volumes to
  # attach to an instance at launch.
  #
  # To override a block device mapping specified in the launch template:
  #
  # - Specify the exact same `DeviceName` here as specified in the launch template.
  #
  # - Only specify the parameters you want to change.
  #
  # - Any parameters you don't specify here will keep their original launch template values.
  #
  # To add a new block device mapping:
  #
  # - Specify a `DeviceName` that doesn't exist in the launch template.
  #
  # - Specify all desired parameters here.
  class FleetBlockDeviceMappingRequest
    # The device name (for example, `/dev/sdh` or `xvdh`).
    property device_name : String | Nil

    # The virtual device name (`ephemeralN`). Instance store volumes are numbered starting from 0. An
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

    # Parameters used to automatically set up EBS volumes when the instance is launched.
    property ebs : FleetEbsBlockDeviceRequest | Nil

    # To omit the device from the block device mapping, specify an empty string. When this property is
    # specified, the device is removed from the block device mapping regardless of the assigned value.
    property no_device : String | Nil

    def initialize(
      @device_name : String | Nil = nil,
      @virtual_name : String | Nil = nil,
      @ebs : FleetEbsBlockDeviceRequest | Nil = nil,
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
        ebs: node.xpath_node("*[local-name()='Ebs']").try { |n| FleetEbsBlockDeviceRequest.from_xml(n) },
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
