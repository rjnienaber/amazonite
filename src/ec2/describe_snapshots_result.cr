private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeSnapshotsResult
    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    # Information about the snapshots.
    property snapshots : Array(Snapshot) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @snapshots : Array(Snapshot) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@snapshots || [] of Snapshot).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SnapshotSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        snapshots: node.xpath_nodes("*[local-name()='snapshotSet']/*[local-name()='item']").map { |n| Snapshot.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @snapshots
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @snapshots)
  end
end
