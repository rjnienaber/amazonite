private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a volume.
  class Volume
    # The ID of the Availability Zone for the volume.
    property availability_zone_id : String | Nil

    # The Amazon Resource Name (ARN) of the Outpost.
    property outpost_arn : String | Nil

    # The ID of the source volume from which the volume copy was created. Only for volume copies.
    property source_volume_id : String | Nil

    # The number of I/O operations per second (IOPS). For `gp3`, `io1`, and `io2` volumes, this
    # represents the number of IOPS that are provisioned for the volume. For `gp2` volumes, this
    # represents the baseline performance of the volume and the rate at which the volume accumulates
    # I/O credits for bursting.
    property iops : Int32 | Nil

    # Any tags assigned to the volume.
    property tags : Array(Tag) | Nil

    # The volume type.
    property volume_type : VolumeType | Nil

    # This parameter is not returned by CreateVolume.
    #
    # Indicates whether the volume was created using fast snapshot restore.
    property fast_restored : Bool | Nil

    # Indicates whether Amazon EBS Multi-Attach is enabled.
    property multi_attach_enabled : Bool | Nil

    # The throughput that the volume supports, in MiB/s.
    property throughput : Int32 | Nil

    # This parameter is not returned by CreateVolume.
    #
    # Reserved for future use.
    property sse_type : SSEType | Nil

    # The service provider that manages the volume.
    property operator : OperatorResponse | Nil

    # The Amazon EBS Provisioned Rate for Volume Initialization (volume initialization rate) specified
    # for the volume during creation, in MiB/s. If no volume initialization rate was specified, the
    # value is `null`.
    property volume_initialization_rate : Int32 | Nil

    # The ID of the volume.
    property volume_id : String | Nil

    # The size of the volume, in GiBs.
    property size : Int32 | Nil

    # The snapshot from which the volume was created, if applicable.
    property snapshot_id : String | Nil

    # The Availability Zone for the volume.
    property availability_zone : String | Nil

    # The volume state.
    property state : VolumeState | Nil

    # The time stamp when volume creation was initiated.
    property create_time : Time | Nil

    # This parameter is not returned by CreateVolume.
    #
    # Information about the volume attachments.
    property attachments : Array(VolumeAttachment) | Nil

    # Indicates whether the volume is encrypted.
    property encrypted : Bool | Nil

    # The Amazon Resource Name (ARN) of the KMS key that was used to protect the volume encryption key
    # for the volume.
    property kms_key_id : String | Nil

    def initialize(
      @availability_zone_id : String | Nil = nil,
      @outpost_arn : String | Nil = nil,
      @source_volume_id : String | Nil = nil,
      @iops : Int32 | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @volume_type : VolumeType | Nil = nil,
      @fast_restored : Bool | Nil = nil,
      @multi_attach_enabled : Bool | Nil = nil,
      @throughput : Int32 | Nil = nil,
      @sse_type : SSEType | Nil = nil,
      @operator : OperatorResponse | Nil = nil,
      @volume_initialization_rate : Int32 | Nil = nil,
      @volume_id : String | Nil = nil,
      @size : Int32 | Nil = nil,
      @snapshot_id : String | Nil = nil,
      @availability_zone : String | Nil = nil,
      @state : VolumeState | Nil = nil,
      @create_time : Time | Nil = nil,
      @attachments : Array(VolumeAttachment) | Nil = nil,
      @encrypted : Bool | Nil = nil,
      @kms_key_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @outpost_arn
        params << {"#{prefix}OutpostArn", value}
      end

      if value = @source_volume_id
        params << {"#{prefix}SourceVolumeId", value}
      end

      if value = @iops
        params << {"#{prefix}Iops", value.to_s}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @volume_type
        params << {"#{prefix}VolumeType", value.to_json_object_key}
      end

      if value = @fast_restored
        params << {"#{prefix}FastRestored", Core::QueryValue.bool(value)}
      end

      if value = @multi_attach_enabled
        params << {"#{prefix}MultiAttachEnabled", Core::QueryValue.bool(value)}
      end

      if value = @throughput
        params << {"#{prefix}Throughput", value.to_s}
      end

      if value = @sse_type
        params << {"#{prefix}SseType", value.to_json_object_key}
      end

      if value = @operator
        params.concat(value.to_query_params("#{prefix}Operator."))
      end

      if value = @volume_initialization_rate
        params << {"#{prefix}VolumeInitializationRate", value.to_s}
      end

      if value = @volume_id
        params << {"#{prefix}VolumeId", value}
      end

      if value = @size
        params << {"#{prefix}Size", value.to_s}
      end

      if value = @snapshot_id
        params << {"#{prefix}SnapshotId", value}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @state
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @create_time
        params << {"#{prefix}CreateTime", Core::QueryValue.time(value)}
      end

      (@attachments || [] of VolumeAttachment).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AttachmentSet.#{i}."))
      end

      if value = @encrypted
        params << {"#{prefix}Encrypted", Core::QueryValue.bool(value)}
      end

      if value = @kms_key_id
        params << {"#{prefix}KmsKeyId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
        outpost_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='outpostArn']")),
        source_volume_id: Core::XMLValue.string(node.xpath_node("*[local-name()='sourceVolumeId']")),
        iops: Core::XMLValue.i32(node.xpath_node("*[local-name()='iops']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        volume_type: (n = node.xpath_node("*[local-name()='volumeType']")) ? AEC::VolumeType.from_json_object_key?(n.content) : nil,
        fast_restored: Core::XMLValue.bool(node.xpath_node("*[local-name()='fastRestored']")),
        multi_attach_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='multiAttachEnabled']")),
        throughput: Core::XMLValue.i32(node.xpath_node("*[local-name()='throughput']")),
        sse_type: (n = node.xpath_node("*[local-name()='sseType']")) ? AEC::SSEType.from_json_object_key?(n.content) : nil,
        operator: node.xpath_node("*[local-name()='operator']").try { |n| OperatorResponse.from_xml(n) },
        volume_initialization_rate: Core::XMLValue.i32(node.xpath_node("*[local-name()='volumeInitializationRate']")),
        volume_id: Core::XMLValue.string(node.xpath_node("*[local-name()='volumeId']")),
        size: Core::XMLValue.i32(node.xpath_node("*[local-name()='size']")),
        snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='snapshotId']")),
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        state: (n = node.xpath_node("*[local-name()='status']")) ? AEC::VolumeState.from_json_object_key?(n.content) : nil,
        create_time: Core::XMLValue.time(node.xpath_node("*[local-name()='createTime']")),
        attachments: node.xpath_nodes("*[local-name()='attachmentSet']/*[local-name()='item']").map { |n| VolumeAttachment.from_xml(n) },
        encrypted: Core::XMLValue.bool(node.xpath_node("*[local-name()='encrypted']")),
        kms_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='kmsKeyId']")),
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end

      if value = @operator
        value.validate!
      end

      if value = @attachments
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@availability_zone_id, @outpost_arn, @source_volume_id, @iops, @tags, @volume_type, @fast_restored, @multi_attach_enabled, @throughput, @sse_type, @operator, @volume_initialization_rate, @volume_id, @size, @snapshot_id, @availability_zone, @state, @create_time, @attachments, @encrypted, @kms_key_id)
  end
end
