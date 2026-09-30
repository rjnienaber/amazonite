private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeLockedSnapshotsResult
    # Information about the snapshots.
    property snapshots : Array(LockedSnapshotsInfo) | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    def initialize(
      @snapshots : Array(LockedSnapshotsInfo) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@snapshots || [] of LockedSnapshotsInfo).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SnapshotSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        snapshots: node.xpath_nodes("*[local-name()='snapshotSet']/*[local-name()='item']").map { |n| LockedSnapshotsInfo.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @snapshots
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@snapshots, @next_token)
  end
end
