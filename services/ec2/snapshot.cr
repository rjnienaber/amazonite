private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a snapshot.
  class Snapshot
    # The Amazon Web Services owner alias, from an Amazon-maintained list (`amazon`). This is not the
    # user-configured Amazon Web Services account alias set using the IAM console.
    property owner_alias : String | Nil

    # The ARN of the Outpost on which the snapshot is stored. For more information, see [Amazon EBS
    # local snapshots on
    # Outposts](https://docs.aws.amazon.com/ebs/latest/userguide/snapshots-outposts.html) in the
    # *Amazon EBS User Guide*.
    property outpost_arn : String | Nil

    # Any tags assigned to the snapshot.
    property tags : Array(Tag) | Nil

    # The storage tier in which the snapshot is stored. `standard` indicates that the snapshot is
    # stored in the standard snapshot storage tier and that it is ready for use. `archive` indicates
    # that the snapshot is currently archived and that it must be restored before it can be used.
    property storage_tier : StorageTier | Nil

    # Only for archived snapshots that are temporarily restored. Indicates the date and time when a
    # temporarily restored snapshot will be automatically re-archived.
    property restore_expiry_time : Time | Nil

    # Reserved for future use.
    property sse_type : SSEType | Nil

    # The Availability Zone or Local Zone of the snapshot. For example, `us-west-1a` (Availability
    # Zone) or `us-west-2-lax-1a` (Local Zone).
    property availability_zone : String | Nil

    # Only for snapshot copies.
    #
    # Indicates whether the snapshot copy was created with a standard or time-based snapshot copy
    # operation. Time-based snapshot copy operations complete within the completion duration specified
    # in the request. Standard snapshot copy operations are completed on a best-effort basis.
    #
    # - `standard` - The snapshot copy was created with a standard snapshot copy operation.
    #
    # - `time-based` - The snapshot copy was created with a time-based snapshot copy operation.
    property transfer_type : TransferType | Nil

    # Only for snapshot copies created with time-based snapshot copy operations.
    #
    # The completion duration requested for the time-based snapshot copy operation.
    property completion_duration_minutes : Int32 | Nil

    # The time stamp when the snapshot was completed.
    property completion_time : Time | Nil

    # The full size of the snapshot, in bytes.
    #
    # This is **not** the incremental size of the snapshot. This is the full snapshot size and
    # represents the size of all the blocks that were written to the source volume at the time the
    # snapshot was created.
    property full_snapshot_size_in_bytes : Int64 | Nil

    # The ID of the snapshot. Each snapshot receives a unique identifier when it is created.
    property snapshot_id : String | Nil

    # The ID of the volume that was used to create the snapshot. Snapshots created by a copy snapshot
    # operation have an arbitrary volume ID that you should not use for any purpose.
    property volume_id : String | Nil

    # The snapshot state.
    property state : SnapshotState | Nil

    # Encrypted Amazon EBS snapshots are copied asynchronously. If a snapshot copy operation fails
    # (for example, if the proper KMS permissions are not obtained) this field displays error state
    # details to help you diagnose why the error occurred. This parameter is only returned by
    # DescribeSnapshots.
    property state_message : String | Nil

    # The time stamp when the snapshot was initiated.
    property start_time : Time | Nil

    # The progress of the snapshot, as a percentage.
    property progress : String | Nil

    # The ID of the Amazon Web Services account that owns the EBS snapshot.
    property owner_id : String | Nil

    # The description for the snapshot.
    property description : String | Nil

    # The size of the volume, in GiB.
    property volume_size : Int32 | Nil

    # Indicates whether the snapshot is encrypted.
    property encrypted : Bool | Nil

    # The Amazon Resource Name (ARN) of the KMS key that was used to protect the volume encryption key
    # for the parent volume.
    property kms_key_id : String | Nil

    # The data encryption key identifier for the snapshot. This value is a unique identifier that
    # corresponds to the data encryption key that was used to encrypt the original volume or snapshot
    # copy. Because data encryption keys are inherited by volumes created from snapshots, and vice
    # versa, if snapshots share the same data encryption key identifier, then they belong to the same
    # volume/snapshot lineage. This parameter is only returned by DescribeSnapshots.
    property data_encryption_key_id : String | Nil

    def initialize(
      @owner_alias : String | Nil = nil,
      @outpost_arn : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @storage_tier : StorageTier | Nil = nil,
      @restore_expiry_time : Time | Nil = nil,
      @sse_type : SSEType | Nil = nil,
      @availability_zone : String | Nil = nil,
      @transfer_type : TransferType | Nil = nil,
      @completion_duration_minutes : Int32 | Nil = nil,
      @completion_time : Time | Nil = nil,
      @full_snapshot_size_in_bytes : Int64 | Nil = nil,
      @snapshot_id : String | Nil = nil,
      @volume_id : String | Nil = nil,
      @state : SnapshotState | Nil = nil,
      @state_message : String | Nil = nil,
      @start_time : Time | Nil = nil,
      @progress : String | Nil = nil,
      @owner_id : String | Nil = nil,
      @description : String | Nil = nil,
      @volume_size : Int32 | Nil = nil,
      @encrypted : Bool | Nil = nil,
      @kms_key_id : String | Nil = nil,
      @data_encryption_key_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @owner_alias
        params << {"#{prefix}OwnerAlias", value}
      end

      if value = @outpost_arn
        params << {"#{prefix}OutpostArn", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @storage_tier
        params << {"#{prefix}StorageTier", value.to_json_object_key}
      end

      if value = @restore_expiry_time
        params << {"#{prefix}RestoreExpiryTime", Core::QueryValue.time(value)}
      end

      if value = @sse_type
        params << {"#{prefix}SseType", value.to_json_object_key}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @transfer_type
        params << {"#{prefix}TransferType", value.to_json_object_key}
      end

      if value = @completion_duration_minutes
        params << {"#{prefix}CompletionDurationMinutes", value.to_s}
      end

      if value = @completion_time
        params << {"#{prefix}CompletionTime", Core::QueryValue.time(value)}
      end

      if value = @full_snapshot_size_in_bytes
        params << {"#{prefix}FullSnapshotSizeInBytes", value.to_s}
      end

      if value = @snapshot_id
        params << {"#{prefix}SnapshotId", value}
      end

      if value = @volume_id
        params << {"#{prefix}VolumeId", value}
      end

      if value = @state
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @state_message
        params << {"#{prefix}StatusMessage", value}
      end

      if value = @start_time
        params << {"#{prefix}StartTime", Core::QueryValue.time(value)}
      end

      if value = @progress
        params << {"#{prefix}Progress", value}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @volume_size
        params << {"#{prefix}VolumeSize", value.to_s}
      end

      if value = @encrypted
        params << {"#{prefix}Encrypted", Core::QueryValue.bool(value)}
      end

      if value = @kms_key_id
        params << {"#{prefix}KmsKeyId", value}
      end

      if value = @data_encryption_key_id
        params << {"#{prefix}DataEncryptionKeyId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        owner_alias: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerAlias']")),
        outpost_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='outpostArn']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        storage_tier: (n = node.xpath_node("*[local-name()='storageTier']")) ? AEC::StorageTier.from_json_object_key?(n.content) : nil,
        restore_expiry_time: Core::XMLValue.time(node.xpath_node("*[local-name()='restoreExpiryTime']")),
        sse_type: (n = node.xpath_node("*[local-name()='sseType']")) ? AEC::SSEType.from_json_object_key?(n.content) : nil,
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        transfer_type: (n = node.xpath_node("*[local-name()='transferType']")) ? AEC::TransferType.from_json_object_key?(n.content) : nil,
        completion_duration_minutes: Core::XMLValue.i32(node.xpath_node("*[local-name()='completionDurationMinutes']")),
        completion_time: Core::XMLValue.time(node.xpath_node("*[local-name()='completionTime']")),
        full_snapshot_size_in_bytes: Core::XMLValue.i64(node.xpath_node("*[local-name()='fullSnapshotSizeInBytes']")),
        snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='snapshotId']")),
        volume_id: Core::XMLValue.string(node.xpath_node("*[local-name()='volumeId']")),
        state: (n = node.xpath_node("*[local-name()='status']")) ? AEC::SnapshotState.from_json_object_key?(n.content) : nil,
        state_message: Core::XMLValue.string(node.xpath_node("*[local-name()='statusMessage']")),
        start_time: Core::XMLValue.time(node.xpath_node("*[local-name()='startTime']")),
        progress: Core::XMLValue.string(node.xpath_node("*[local-name()='progress']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        volume_size: Core::XMLValue.i32(node.xpath_node("*[local-name()='volumeSize']")),
        encrypted: Core::XMLValue.bool(node.xpath_node("*[local-name()='encrypted']")),
        kms_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='kmsKeyId']")),
        data_encryption_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='dataEncryptionKeyId']")),
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@owner_alias, @outpost_arn, @tags, @storage_tier, @restore_expiry_time, @sse_type, @availability_zone, @transfer_type, @completion_duration_minutes, @completion_time, @full_snapshot_size_in_bytes, @snapshot_id, @volume_id, @state, @state_message, @start_time, @progress, @owner_id, @description, @volume_size, @encrypted, @kms_key_id, @data_encryption_key_id)
  end
end
