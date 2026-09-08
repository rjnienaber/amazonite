private alias Core = Amazonite::Core

module Amazonite::EC2
  class RestoreSnapshotTierResult
    # The ID of the snapshot.
    property snapshot_id : String | Nil

    # The date and time when the snapshot restore process started.
    property restore_start_time : Time | Nil

    # For temporary restores only. The number of days for which the archived snapshot is temporarily
    # restored.
    property restore_duration : Int32 | Nil

    # Indicates whether the snapshot is permanently restored. `true` indicates a permanent restore.
    # `false` indicates a temporary restore.
    property is_permanent_restore : Bool | Nil

    def initialize(
      @snapshot_id : String | Nil = nil,
      @restore_start_time : Time | Nil = nil,
      @restore_duration : Int32 | Nil = nil,
      @is_permanent_restore : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @snapshot_id
        params << {"#{prefix}SnapshotId", value}
      end

      if value = @restore_start_time
        params << {"#{prefix}RestoreStartTime", Core::QueryValue.time(value)}
      end

      if value = @restore_duration
        params << {"#{prefix}RestoreDuration", value.to_s}
      end

      if value = @is_permanent_restore
        params << {"#{prefix}IsPermanentRestore", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='snapshotId']")),
        restore_start_time: Core::XMLValue.time(node.xpath_node("*[local-name()='restoreStartTime']")),
        restore_duration: Core::XMLValue.i32(node.xpath_node("*[local-name()='restoreDuration']")),
        is_permanent_restore: Core::XMLValue.bool(node.xpath_node("*[local-name()='isPermanentRestore']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@snapshot_id, @restore_start_time, @restore_duration, @is_permanent_restore)
  end
end
