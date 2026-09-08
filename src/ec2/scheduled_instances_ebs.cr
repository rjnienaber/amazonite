private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an EBS volume for a Scheduled Instance.
  class ScheduledInstancesEbs
    # Indicates whether the volume is deleted on instance termination.
    property delete_on_termination : Bool | Nil

    # Indicates whether the volume is encrypted. You can attached encrypted volumes only to instances
    # that support them.
    property encrypted : Bool | Nil

    # The number of I/O operations per second (IOPS) to provision for a `gp3`, `io1`, or `io2` volume.
    property iops : Int32 | Nil

    # The ID of the snapshot.
    property snapshot_id : String | Nil

    # The size of the volume, in GiB.
    #
    # Default: If you're creating the volume from a snapshot and don't specify a volume size, the
    # default is the snapshot size.
    property volume_size : Int32 | Nil

    # The volume type.
    #
    # Default: `gp2`
    property volume_type : String | Nil

    def initialize(
      @delete_on_termination : Bool | Nil = nil,
      @encrypted : Bool | Nil = nil,
      @iops : Int32 | Nil = nil,
      @snapshot_id : String | Nil = nil,
      @volume_size : Int32 | Nil = nil,
      @volume_type : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @delete_on_termination
        params << {"#{prefix}DeleteOnTermination", Core::QueryValue.bool(value)}
      end

      if value = @encrypted
        params << {"#{prefix}Encrypted", Core::QueryValue.bool(value)}
      end

      if value = @iops
        params << {"#{prefix}Iops", value.to_s}
      end

      if value = @snapshot_id
        params << {"#{prefix}SnapshotId", value}
      end

      if value = @volume_size
        params << {"#{prefix}VolumeSize", value.to_s}
      end

      if value = @volume_type
        params << {"#{prefix}VolumeType", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        delete_on_termination: Core::XMLValue.bool(node.xpath_node("*[local-name()='DeleteOnTermination']")),
        encrypted: Core::XMLValue.bool(node.xpath_node("*[local-name()='Encrypted']")),
        iops: Core::XMLValue.i32(node.xpath_node("*[local-name()='Iops']")),
        snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SnapshotId']")),
        volume_size: Core::XMLValue.i32(node.xpath_node("*[local-name()='VolumeSize']")),
        volume_type: Core::XMLValue.string(node.xpath_node("*[local-name()='VolumeType']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@delete_on_termination, @encrypted, @iops, @snapshot_id, @volume_size, @volume_type)
  end
end
