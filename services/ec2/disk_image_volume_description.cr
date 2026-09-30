private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a disk image volume.
  class DiskImageVolumeDescription
    # The volume identifier.
    property id : String | Nil

    # The size of the volume, in GiB.
    property size : Int64 | Nil

    def initialize(
      @id : String | Nil = nil,
      @size : Int64 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @id
        params << {"#{prefix}Id", value}
      end

      if value = @size
        params << {"#{prefix}Size", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        id: Core::XMLValue.string(node.xpath_node("*[local-name()='id']")),
        size: Core::XMLValue.i64(node.xpath_node("*[local-name()='size']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@id, @size)
  end
end
