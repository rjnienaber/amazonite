private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeVpcBlockPublicAccessExclusionsResult
    # Details related to the exclusions.
    property vpc_block_public_access_exclusions : Array(VpcBlockPublicAccessExclusion) | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    def initialize(
      @vpc_block_public_access_exclusions : Array(VpcBlockPublicAccessExclusion) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@vpc_block_public_access_exclusions || [] of VpcBlockPublicAccessExclusion).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}VpcBlockPublicAccessExclusionSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpc_block_public_access_exclusions: node.xpath_nodes("*[local-name()='vpcBlockPublicAccessExclusionSet']/*[local-name()='item']").map { |n| VpcBlockPublicAccessExclusion.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @vpc_block_public_access_exclusions
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@vpc_block_public_access_exclusions, @next_token)
  end
end
