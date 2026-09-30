private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeSnapshotTierStatusResult
    # Information about the snapshot's storage tier.
    property snapshot_tier_statuses : Array(SnapshotTierStatus) | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    def initialize(
      @snapshot_tier_statuses : Array(SnapshotTierStatus) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@snapshot_tier_statuses || [] of SnapshotTierStatus).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SnapshotTierStatusSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        snapshot_tier_statuses: node.xpath_nodes("*[local-name()='snapshotTierStatusSet']/*[local-name()='item']").map { |n| SnapshotTierStatus.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @snapshot_tier_statuses
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@snapshot_tier_statuses, @next_token)
  end
end
