private alias Core = Amazonite::Core

module Amazonite::EC2
  class ListVolumesInRecycleBinResult
    # Information about the volumes.
    property volumes : Array(VolumeRecycleBinInfo) | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    def initialize(
      @volumes : Array(VolumeRecycleBinInfo) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@volumes || [] of VolumeRecycleBinInfo).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}VolumeSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        volumes: node.xpath_nodes("*[local-name()='volumeSet']/*[local-name()='item']").map { |n| VolumeRecycleBinInfo.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @volumes
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@volumes, @next_token)
  end
end
