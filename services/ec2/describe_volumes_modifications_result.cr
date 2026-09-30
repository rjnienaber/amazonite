private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeVolumesModificationsResult
    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    # Information about the volume modifications.
    property volumes_modifications : Array(VolumeModification) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @volumes_modifications : Array(VolumeModification) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@volumes_modifications || [] of VolumeModification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}VolumeModificationSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        volumes_modifications: node.xpath_nodes("*[local-name()='volumeModificationSet']/*[local-name()='item']").map { |n| VolumeModification.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @volumes_modifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @volumes_modifications)
  end
end
