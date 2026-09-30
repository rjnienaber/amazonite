private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a block device mapping for a Scheduled Instance.
  class ScheduledInstancesBlockDeviceMapping
    # The device name (for example, `/dev/sdh` or `xvdh`).
    property device_name : String | Nil

    # Parameters used to set up EBS volumes automatically when the instance is launched.
    property ebs : ScheduledInstancesEbs | Nil

    # To omit the device from the block device mapping, specify an empty string.
    property no_device : String | Nil

    # The virtual device name (`ephemeral`N). Instance store volumes are numbered starting from 0. An
    # instance type with two available instance store volumes can specify mappings for `ephemeral0`
    # and `ephemeral1`. The number of available instance store volumes depends on the instance type.
    # After you connect to the instance, you must mount the volume.
    #
    # Constraints: For M3 instances, you must specify instance store volumes in the block device
    # mapping for the instance. When you launch an M3 instance, we ignore any instance store volumes
    # specified in the block device mapping for the AMI.
    property virtual_name : String | Nil

    def initialize(
      @device_name : String | Nil = nil,
      @ebs : ScheduledInstancesEbs | Nil = nil,
      @no_device : String | Nil = nil,
      @virtual_name : String | Nil = nil,
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

      if value = @no_device
        params << {"#{prefix}NoDevice", value}
      end

      if value = @virtual_name
        params << {"#{prefix}VirtualName", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        device_name: Core::XMLValue.string(node.xpath_node("*[local-name()='DeviceName']")),
        ebs: node.xpath_node("*[local-name()='Ebs']").try { |n| ScheduledInstancesEbs.from_xml(n) },
        no_device: Core::XMLValue.string(node.xpath_node("*[local-name()='NoDevice']")),
        virtual_name: Core::XMLValue.string(node.xpath_node("*[local-name()='VirtualName']")),
      )
    end

    def validate! : Nil
      if value = @ebs
        value.validate!
      end
    end

    def_equals_and_hash(@device_name, @ebs, @no_device, @virtual_name)
  end
end
