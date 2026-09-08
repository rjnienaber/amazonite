private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a block device mapping.
  class InstanceBlockDeviceMapping
    # The device name.
    property device_name : String | Nil

    # Parameters used to automatically set up EBS volumes when the instance is launched.
    property ebs : EbsInstanceBlockDevice | Nil

    def initialize(
      @device_name : String | Nil = nil,
      @ebs : EbsInstanceBlockDevice | Nil = nil,
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
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        device_name: Core::XMLValue.string(node.xpath_node("*[local-name()='deviceName']")),
        ebs: node.xpath_node("*[local-name()='ebs']").try { |n| EbsInstanceBlockDevice.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ebs
        value.validate!
      end
    end

    def_equals_and_hash(@device_name, @ebs)
  end
end
