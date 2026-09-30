private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeCapacityBlockExtensionOfferingsResult
    # The recommended Capacity Block extension offerings for the dates specified.
    property capacity_block_extension_offerings : Array(CapacityBlockExtensionOffering) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @capacity_block_extension_offerings : Array(CapacityBlockExtensionOffering) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@capacity_block_extension_offerings || [] of CapacityBlockExtensionOffering).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}CapacityBlockExtensionOfferingSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_block_extension_offerings: node.xpath_nodes("*[local-name()='capacityBlockExtensionOfferingSet']/*[local-name()='item']").map { |n| CapacityBlockExtensionOffering.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @capacity_block_extension_offerings
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@capacity_block_extension_offerings, @next_token)
  end
end
