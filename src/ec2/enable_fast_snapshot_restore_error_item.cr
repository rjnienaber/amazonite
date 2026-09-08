private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains information about the errors that occurred when enabling fast snapshot restores.
  class EnableFastSnapshotRestoreErrorItem
    # The ID of the snapshot.
    property snapshot_id : String | Nil

    # The errors.
    property fast_snapshot_restore_state_errors : Array(EnableFastSnapshotRestoreStateErrorItem) | Nil

    def initialize(
      @snapshot_id : String | Nil = nil,
      @fast_snapshot_restore_state_errors : Array(EnableFastSnapshotRestoreStateErrorItem) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @snapshot_id
        params << {"#{prefix}SnapshotId", value}
      end

      (@fast_snapshot_restore_state_errors || [] of EnableFastSnapshotRestoreStateErrorItem).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}FastSnapshotRestoreStateErrorSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='snapshotId']")),
        fast_snapshot_restore_state_errors: node.xpath_nodes("*[local-name()='fastSnapshotRestoreStateErrorSet']/*[local-name()='item']").map { |n| EnableFastSnapshotRestoreStateErrorItem.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @fast_snapshot_restore_state_errors
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@snapshot_id, @fast_snapshot_restore_state_errors)
  end
end
