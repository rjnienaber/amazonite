private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains information about an error that occurred when enabling fast snapshot restores.
  class EnableFastSnapshotRestoreStateErrorItem
    # The Availability Zone.
    property availability_zone : String | Nil

    # The ID of the Availability Zone.
    property availability_zone_id : String | Nil

    # The error.
    property error : EnableFastSnapshotRestoreStateError | Nil

    def initialize(
      @availability_zone : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @error : EnableFastSnapshotRestoreStateError | Nil = nil,
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

      if value = @error
        params.concat(value.to_query_params("#{prefix}Error."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
        error: node.xpath_node("*[local-name()='error']").try { |n| EnableFastSnapshotRestoreStateError.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @error
        value.validate!
      end
    end

    def_equals_and_hash(@availability_zone, @availability_zone_id, @error)
  end
end
