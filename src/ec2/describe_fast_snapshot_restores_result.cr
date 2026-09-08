private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeFastSnapshotRestoresResult
    # Information about the state of fast snapshot restores.
    property fast_snapshot_restores : Array(DescribeFastSnapshotRestoreSuccessItem) | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    def initialize(
      @fast_snapshot_restores : Array(DescribeFastSnapshotRestoreSuccessItem) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@fast_snapshot_restores || [] of DescribeFastSnapshotRestoreSuccessItem).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}FastSnapshotRestoreSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        fast_snapshot_restores: node.xpath_nodes("*[local-name()='fastSnapshotRestoreSet']/*[local-name()='item']").map { |n| DescribeFastSnapshotRestoreSuccessItem.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @fast_snapshot_restores
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@fast_snapshot_restores, @next_token)
  end
end
