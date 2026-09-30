private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes information used to set up an EBS volume specified in a block device mapping.
  class EbsInstanceBlockDeviceSpecification
    # The ID of the EBS volume.
    property volume_id : String | Nil

    # Indicates whether the volume is deleted on instance termination.
    property delete_on_termination : Bool | Nil

    def initialize(
      @volume_id : String | Nil = nil,
      @delete_on_termination : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @volume_id
        params << {"#{prefix}VolumeId", value}
      end

      if value = @delete_on_termination
        params << {"#{prefix}DeleteOnTermination", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        volume_id: Core::XMLValue.string(node.xpath_node("*[local-name()='volumeId']")),
        delete_on_termination: Core::XMLValue.bool(node.xpath_node("*[local-name()='deleteOnTermination']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@volume_id, @delete_on_termination)
  end
end
