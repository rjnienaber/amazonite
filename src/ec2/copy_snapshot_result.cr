private alias Core = Amazonite::Core

module Amazonite::EC2
  class CopySnapshotResult
    # Any tags applied to the new snapshot.
    property tags : Array(Tag) | Nil

    # The ID of the new snapshot.
    property snapshot_id : String | Nil

    def initialize(
      @tags : Array(Tag) | Nil = nil,
      @snapshot_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @snapshot_id
        params << {"#{prefix}SnapshotId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='snapshotId']")),
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@tags, @snapshot_id)
  end
end
