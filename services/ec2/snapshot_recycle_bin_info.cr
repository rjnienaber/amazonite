private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about a snapshot that is currently in the Recycle Bin.
  class SnapshotRecycleBinInfo
    # The ID of the snapshot.
    property snapshot_id : String | Nil

    # The date and time when the snapshot entered the Recycle Bin.
    property recycle_bin_enter_time : Time | Nil

    # The date and time when the snapshot is to be permanently deleted from the Recycle Bin.
    property recycle_bin_exit_time : Time | Nil

    # The description for the snapshot.
    property description : String | Nil

    # The ID of the volume from which the snapshot was created.
    property volume_id : String | Nil

    def initialize(
      @snapshot_id : String | Nil = nil,
      @recycle_bin_enter_time : Time | Nil = nil,
      @recycle_bin_exit_time : Time | Nil = nil,
      @description : String | Nil = nil,
      @volume_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @snapshot_id
        params << {"#{prefix}SnapshotId", value}
      end

      if value = @recycle_bin_enter_time
        params << {"#{prefix}RecycleBinEnterTime", Core::QueryValue.time(value)}
      end

      if value = @recycle_bin_exit_time
        params << {"#{prefix}RecycleBinExitTime", Core::QueryValue.time(value)}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @volume_id
        params << {"#{prefix}VolumeId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='snapshotId']")),
        recycle_bin_enter_time: Core::XMLValue.time(node.xpath_node("*[local-name()='recycleBinEnterTime']")),
        recycle_bin_exit_time: Core::XMLValue.time(node.xpath_node("*[local-name()='recycleBinExitTime']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        volume_id: Core::XMLValue.string(node.xpath_node("*[local-name()='volumeId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@snapshot_id, @recycle_bin_enter_time, @recycle_bin_exit_time, @description, @volume_id)
  end
end
