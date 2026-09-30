private alias Core = Amazonite::Core

module Amazonite::EC2
  class ImportVolumeRequest
    # The ID of the Availability Zone for the resulting EBS volume.
    #
    # Either `AvailabilityZone` or `AvailabilityZoneId` must be specified, but not both.
    property availability_zone_id : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The Availability Zone for the resulting EBS volume.
    #
    # Either `AvailabilityZone` or `AvailabilityZoneId` must be specified, but not both.
    property availability_zone : String | Nil

    # The disk image.
    property image : DiskImageDetail

    # A description of the volume.
    property description : String | Nil

    # The volume size.
    property volume : VolumeDetail

    def initialize(
      @image : DiskImageDetail,
      @volume : VolumeDetail,
      @availability_zone_id : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @availability_zone : String | Nil = nil,
      @description : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      params.concat(@image.to_query_params("#{prefix}Image."))

      if value = @description
        params << {"#{prefix}Description", value}
      end

      params.concat(@volume.to_query_params("#{prefix}Volume."))
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AvailabilityZoneId']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        image: node.xpath_node("*[local-name()='image']").try { |n| DiskImageDetail.from_xml(n) }.not_nil!,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        volume: node.xpath_node("*[local-name()='volume']").try { |n| VolumeDetail.from_xml(n) }.not_nil!,
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

    def_equals_and_hash(@availability_zone_id, @dry_run, @availability_zone, @image, @description, @volume)
  end
end
