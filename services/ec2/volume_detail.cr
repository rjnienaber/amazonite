private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an EBS volume.
  class VolumeDetail
    # The size of the volume, in GiB.
    property size : Int64

    def initialize(
      @size : Int64,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Size", @size.to_s}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        size: Core::XMLValue.i64(node.xpath_node("*[local-name()='size']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@size)
  end
end
