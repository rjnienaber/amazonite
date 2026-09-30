private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeVolumesResult
    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    # Information about the volumes.
    property volumes : Array(Volume) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @volumes : Array(Volume) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@volumes || [] of Volume).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}VolumeSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        volumes: node.xpath_nodes("*[local-name()='volumeSet']/*[local-name()='item']").map { |n| Volume.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @volumes
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @volumes)
  end
end
