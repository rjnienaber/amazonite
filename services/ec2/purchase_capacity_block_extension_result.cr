private alias Core = Amazonite::Core

module Amazonite::EC2
  class PurchaseCapacityBlockExtensionResult
    # The purchased Capacity Block extensions.
    property capacity_block_extensions : Array(CapacityBlockExtension) | Nil

    def initialize(
      @capacity_block_extensions : Array(CapacityBlockExtension) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@capacity_block_extensions || [] of CapacityBlockExtension).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}CapacityBlockExtensionSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_block_extensions: node.xpath_nodes("*[local-name()='capacityBlockExtensionSet']/*[local-name()='item']").map { |n| CapacityBlockExtension.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @capacity_block_extensions
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@capacity_block_extensions)
  end
end
