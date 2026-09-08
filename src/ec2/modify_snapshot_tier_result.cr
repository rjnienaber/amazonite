private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifySnapshotTierResult
    # The ID of the snapshot.
    property snapshot_id : String | Nil

    # The date and time when the archive process was started.
    property tiering_start_time : Time | Nil

    def initialize(
      @snapshot_id : String | Nil = nil,
      @tiering_start_time : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @snapshot_id
        params << {"#{prefix}SnapshotId", value}
      end

      if value = @tiering_start_time
        params << {"#{prefix}TieringStartTime", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='snapshotId']")),
        tiering_start_time: Core::XMLValue.time(node.xpath_node("*[local-name()='tieringStartTime']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@snapshot_id, @tiering_start_time)
  end
end
