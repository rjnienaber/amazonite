private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about a volume that is currently in the Recycle Bin.
  class VolumeRecycleBinInfo
    # The ID of the volume.
    property volume_id : String | Nil

    # The volume type.
    property volume_type : VolumeType | Nil

    # The state of the volume.
    property state : VolumeState | Nil

    # The size of the volume, in GiB.
    property size : Int32 | Nil

    # The number of I/O operations per second (IOPS) for the volume.
    property iops : Int32 | Nil

    # The throughput that the volume supports, in MiB/s.
    property throughput : Int32 | Nil

    # The ARN of the Outpost on which the volume is stored. For more information, see [Amazon EBS
    # volumes on Outposts](https://docs.aws.amazon.com/ebs/latest/userguide/ebs-volumes-outposts.html)
    # in the *Amazon EBS User Guide*.
    property outpost_arn : String | Nil

    # The Availability Zone for the volume.
    property availability_zone : String | Nil

    # The ID of the Availability Zone for the volume.
    property availability_zone_id : String | Nil

    # The ID of the source volume.
    property source_volume_id : String | Nil

    # The snapshot from which the volume was created, if applicable.
    property snapshot_id : String | Nil

    # The service provider that manages the volume.
    property operator : OperatorResponse | Nil

    # The time stamp when volume creation was initiated.
    property create_time : Time | Nil

    # The date and time when the volume entered the Recycle Bin.
    property recycle_bin_enter_time : Time | Nil

    # The date and time when the volume is to be permanently deleted from the Recycle Bin.
    property recycle_bin_exit_time : Time | Nil

    def initialize(
      @volume_id : String | Nil = nil,
      @volume_type : VolumeType | Nil = nil,
      @state : VolumeState | Nil = nil,
      @size : Int32 | Nil = nil,
      @iops : Int32 | Nil = nil,
      @throughput : Int32 | Nil = nil,
      @outpost_arn : String | Nil = nil,
      @availability_zone : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @source_volume_id : String | Nil = nil,
      @snapshot_id : String | Nil = nil,
      @operator : OperatorResponse | Nil = nil,
      @create_time : Time | Nil = nil,
      @recycle_bin_enter_time : Time | Nil = nil,
      @recycle_bin_exit_time : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @volume_id
        params << {"#{prefix}VolumeId", value}
      end

      if value = @volume_type
        params << {"#{prefix}VolumeType", value.to_json_object_key}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @size
        params << {"#{prefix}Size", value.to_s}
      end

      if value = @iops
        params << {"#{prefix}Iops", value.to_s}
      end

      if value = @throughput
        params << {"#{prefix}Throughput", value.to_s}
      end

      if value = @outpost_arn
        params << {"#{prefix}OutpostArn", value}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @source_volume_id
        params << {"#{prefix}SourceVolumeId", value}
      end

      if value = @snapshot_id
        params << {"#{prefix}SnapshotId", value}
      end

      if value = @operator
        params.concat(value.to_query_params("#{prefix}Operator."))
      end

      if value = @create_time
        params << {"#{prefix}CreateTime", Core::QueryValue.time(value)}
      end

      if value = @recycle_bin_enter_time
        params << {"#{prefix}RecycleBinEnterTime", Core::QueryValue.time(value)}
      end

      if value = @recycle_bin_exit_time
        params << {"#{prefix}RecycleBinExitTime", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        volume_id: Core::XMLValue.string(node.xpath_node("*[local-name()='volumeId']")),
        volume_type: (n = node.xpath_node("*[local-name()='volumeType']")) ? AEC::VolumeType.from_json_object_key?(n.content) : nil,
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::VolumeState.from_json_object_key?(n.content) : nil,
        size: Core::XMLValue.i32(node.xpath_node("*[local-name()='size']")),
        iops: Core::XMLValue.i32(node.xpath_node("*[local-name()='iops']")),
        throughput: Core::XMLValue.i32(node.xpath_node("*[local-name()='throughput']")),
        outpost_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='outpostArn']")),
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
        source_volume_id: Core::XMLValue.string(node.xpath_node("*[local-name()='sourceVolumeId']")),
        snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='snapshotId']")),
        operator: node.xpath_node("*[local-name()='operator']").try { |n| OperatorResponse.from_xml(n) },
        create_time: Core::XMLValue.time(node.xpath_node("*[local-name()='createTime']")),
        recycle_bin_enter_time: Core::XMLValue.time(node.xpath_node("*[local-name()='recycleBinEnterTime']")),
        recycle_bin_exit_time: Core::XMLValue.time(node.xpath_node("*[local-name()='recycleBinExitTime']")),
      )
    end

    def validate! : Nil
      if value = @operator
        value.validate!
      end
    end

    def_equals_and_hash(@volume_id, @volume_type, @state, @size, @iops, @throughput, @outpost_arn, @availability_zone, @availability_zone_id, @source_volume_id, @snapshot_id, @operator, @create_time, @recycle_bin_enter_time, @recycle_bin_exit_time)
  end
end
