private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Provides information about a snapshot's storage tier.
  class SnapshotTierStatus
    # The ID of the snapshot.
    property snapshot_id : String | Nil

    # The ID of the volume from which the snapshot was created.
    property volume_id : String | Nil

    # The state of the snapshot.
    property status : SnapshotState | Nil

    # The ID of the Amazon Web Services account that owns the snapshot.
    property owner_id : String | Nil

    # The tags that are assigned to the snapshot.
    property tags : Array(Tag) | Nil

    # The storage tier in which the snapshot is stored. `standard` indicates that the snapshot is
    # stored in the standard snapshot storage tier and that it is ready for use. `archive` indicates
    # that the snapshot is currently archived and that it must be restored before it can be used.
    property storage_tier : StorageTier | Nil

    # The date and time when the last archive or restore process was started.
    property last_tiering_start_time : Time | Nil

    # The progress of the last archive or restore process, as a percentage.
    property last_tiering_progress : Int32 | Nil

    # The status of the last archive or restore process.
    property last_tiering_operation_status : TieringOperationStatus | Nil

    # A message describing the status of the last archive or restore process.
    property last_tiering_operation_status_detail : String | Nil

    # The date and time when the last archive process was completed.
    property archival_complete_time : Time | Nil

    # Only for archived snapshots that are temporarily restored. Indicates the date and time when a
    # temporarily restored snapshot will be automatically re-archived.
    property restore_expiry_time : Time | Nil

    def initialize(
      @snapshot_id : String | Nil = nil,
      @volume_id : String | Nil = nil,
      @status : SnapshotState | Nil = nil,
      @owner_id : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @storage_tier : StorageTier | Nil = nil,
      @last_tiering_start_time : Time | Nil = nil,
      @last_tiering_progress : Int32 | Nil = nil,
      @last_tiering_operation_status : TieringOperationStatus | Nil = nil,
      @last_tiering_operation_status_detail : String | Nil = nil,
      @archival_complete_time : Time | Nil = nil,
      @restore_expiry_time : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @snapshot_id
        params << {"#{prefix}SnapshotId", value}
      end

      if value = @volume_id
        params << {"#{prefix}VolumeId", value}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @storage_tier
        params << {"#{prefix}StorageTier", value.to_json_object_key}
      end

      if value = @last_tiering_start_time
        params << {"#{prefix}LastTieringStartTime", Core::QueryValue.time(value)}
      end

      if value = @last_tiering_progress
        params << {"#{prefix}LastTieringProgress", value.to_s}
      end

      if value = @last_tiering_operation_status
        params << {"#{prefix}LastTieringOperationStatus", value.to_json_object_key}
      end

      if value = @last_tiering_operation_status_detail
        params << {"#{prefix}LastTieringOperationStatusDetail", value}
      end

      if value = @archival_complete_time
        params << {"#{prefix}ArchivalCompleteTime", Core::QueryValue.time(value)}
      end

      if value = @restore_expiry_time
        params << {"#{prefix}RestoreExpiryTime", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='snapshotId']")),
        volume_id: Core::XMLValue.string(node.xpath_node("*[local-name()='volumeId']")),
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::SnapshotState.from_json_object_key?(n.content) : nil,
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        storage_tier: (n = node.xpath_node("*[local-name()='storageTier']")) ? AEC::StorageTier.from_json_object_key?(n.content) : nil,
        last_tiering_start_time: Core::XMLValue.time(node.xpath_node("*[local-name()='lastTieringStartTime']")),
        last_tiering_progress: Core::XMLValue.i32(node.xpath_node("*[local-name()='lastTieringProgress']")),
        last_tiering_operation_status: (n = node.xpath_node("*[local-name()='lastTieringOperationStatus']")) ? AEC::TieringOperationStatus.from_json_object_key?(n.content) : nil,
        last_tiering_operation_status_detail: Core::XMLValue.string(node.xpath_node("*[local-name()='lastTieringOperationStatusDetail']")),
        archival_complete_time: Core::XMLValue.time(node.xpath_node("*[local-name()='archivalCompleteTime']")),
        restore_expiry_time: Core::XMLValue.time(node.xpath_node("*[local-name()='restoreExpiryTime']")),
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@snapshot_id, @volume_id, @status, @owner_id, @tags, @storage_tier, @last_tiering_start_time, @last_tiering_progress, @last_tiering_operation_status, @last_tiering_operation_status_detail, @archival_complete_time, @restore_expiry_time)
  end
end
