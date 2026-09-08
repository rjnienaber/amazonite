private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a disk image.
  class DiskImage
    # A description of the disk image.
    property description : String | Nil

    # Information about the disk image.
    property image : DiskImageDetail | Nil

    # Information about the volume.
    property volume : VolumeDetail | Nil

    def initialize(
      @description : String | Nil = nil,
      @image : DiskImageDetail | Nil = nil,
      @volume : VolumeDetail | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @image
        params.concat(value.to_query_params("#{prefix}Image."))
      end

      if value = @volume
        params.concat(value.to_query_params("#{prefix}Volume."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        image: node.xpath_node("*[local-name()='Image']").try { |n| DiskImageDetail.from_xml(n) },
        volume: node.xpath_node("*[local-name()='Volume']").try { |n| VolumeDetail.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @image
        value.validate!
      end

      if value = @volume
        value.validate!
      end
    end

    def_equals_and_hash(@description, @image, @volume)
  end
end
