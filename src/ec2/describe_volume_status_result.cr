private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeVolumeStatusResult
    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    # Information about the status of the volumes.
    property volume_statuses : Array(VolumeStatusItem) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @volume_statuses : Array(VolumeStatusItem) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@volume_statuses || [] of VolumeStatusItem).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}VolumeStatusSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        volume_statuses: node.xpath_nodes("*[local-name()='volumeStatusSet']/*[local-name()='item']").map { |n| VolumeStatusItem.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @volume_statuses
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @volume_statuses)
  end
end
