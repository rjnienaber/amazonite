private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateSnapshotsResult
    # List of snapshots.
    property snapshots : Array(SnapshotInfo) | Nil

    def initialize(
      @snapshots : Array(SnapshotInfo) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@snapshots || [] of SnapshotInfo).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SnapshotSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        snapshots: node.xpath_nodes("*[local-name()='snapshotSet']/*[local-name()='item']").map { |n| SnapshotInfo.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @snapshots
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@snapshots)
  end
end
