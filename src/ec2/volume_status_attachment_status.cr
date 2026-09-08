private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about the instances to which the volume is attached.
  class VolumeStatusAttachmentStatus
    # The maximum IOPS supported by the attached instance.
    property io_performance : String | Nil

    # The ID of the attached instance.
    property instance_id : String | Nil

    def initialize(
      @io_performance : String | Nil = nil,
      @instance_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @io_performance
        params << {"#{prefix}IoPerformance", value}
      end

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        io_performance: Core::XMLValue.string(node.xpath_node("*[local-name()='ioPerformance']")),
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@io_performance, @instance_id)
  end
end
