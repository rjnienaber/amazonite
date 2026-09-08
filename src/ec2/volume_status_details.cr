private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a volume status.
  class VolumeStatusDetails
    # The name of the volume status.
    #
    # - `io-enabled` - Indicates the volume I/O status. For more information, see [Amazon EBS volume
    # status checks](https://docs.aws.amazon.com/ebs/latest/userguide/monitoring-volume-checks.html).
    #
    # - `io-performance` - Indicates the volume performance status. For more information, see [Amazon
    # EBS volume status
    # checks](https://docs.aws.amazon.com/ebs/latest/userguide/monitoring-volume-checks.html).
    #
    # - `initialization-state` - Indicates the status of the volume initialization process. For more
    # information, see [Initialize Amazon EBS
    # volumes](https://docs.aws.amazon.com/ebs/latest/userguide/initalize-volume.html).
    property name : VolumeStatusName | Nil

    # The intended status of the volume status.
    property status : String | Nil

    def initialize(
      @name : VolumeStatusName | Nil = nil,
      @status : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @name
        params << {"#{prefix}Name", value.to_json_object_key}
      end

      if value = @status
        params << {"#{prefix}Status", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        name: (n = node.xpath_node("*[local-name()='name']")) ? AEC::VolumeStatusName.from_json_object_key?(n.content) : nil,
        status: Core::XMLValue.string(node.xpath_node("*[local-name()='status']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@name, @status)
  end
end
