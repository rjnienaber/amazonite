private alias Core = Amazonite::Core

module Amazonite::EC2
  class UnlockSnapshotResult
    # The ID of the snapshot.
    property snapshot_id : String | Nil

    def initialize(
      @snapshot_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @snapshot_id
        params << {"#{prefix}SnapshotId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='snapshotId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@snapshot_id)
  end
end
