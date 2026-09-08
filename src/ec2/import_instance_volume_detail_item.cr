private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an import volume task.
  class ImportInstanceVolumeDetailItem
    # The Availability Zone where the resulting instance will reside.
    property availability_zone : String | Nil

    # The ID of the Availability Zone where the resulting instance will reside.
    property availability_zone_id : String | Nil

    # The number of bytes converted so far.
    property bytes_converted : Int64 | Nil

    # A description of the task.
    property description : String | Nil

    # The image.
    property image : DiskImageDescription | Nil

    # The status of the import of this particular disk image.
    property status : String | Nil

    # The status information or errors related to the disk image.
    property status_message : String | Nil

    # The volume.
    property volume : DiskImageVolumeDescription | Nil

    def initialize(
      @availability_zone : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @bytes_converted : Int64 | Nil = nil,
      @description : String | Nil = nil,
      @image : DiskImageDescription | Nil = nil,
      @status : String | Nil = nil,
      @status_message : String | Nil = nil,
      @volume : DiskImageVolumeDescription | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @bytes_converted
        params << {"#{prefix}BytesConverted", value.to_s}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @image
        params.concat(value.to_query_params("#{prefix}Image."))
      end

      if value = @status
        params << {"#{prefix}Status", value}
      end

      if value = @status_message
        params << {"#{prefix}StatusMessage", value}
      end

      if value = @volume
        params.concat(value.to_query_params("#{prefix}Volume."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
        bytes_converted: Core::XMLValue.i64(node.xpath_node("*[local-name()='bytesConverted']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        image: node.xpath_node("*[local-name()='image']").try { |n| DiskImageDescription.from_xml(n) },
        status: Core::XMLValue.string(node.xpath_node("*[local-name()='status']")),
        status_message: Core::XMLValue.string(node.xpath_node("*[local-name()='statusMessage']")),
        volume: node.xpath_node("*[local-name()='volume']").try { |n| DiskImageVolumeDescription.from_xml(n) },
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

    def_equals_and_hash(@availability_zone, @availability_zone_id, @bytes_converted, @description, @image, @status, @status_message, @volume)
  end
end
