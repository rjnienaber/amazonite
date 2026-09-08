private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeSecondaryNetworksResult
    # Information about the secondary networks.
    property secondary_networks : Array(SecondaryNetwork) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @secondary_networks : Array(SecondaryNetwork) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@secondary_networks || [] of SecondaryNetwork).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SecondaryNetworkSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        secondary_networks: node.xpath_nodes("*[local-name()='secondaryNetworkSet']/*[local-name()='item']").map { |n| SecondaryNetwork.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @secondary_networks
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@secondary_networks, @next_token)
  end
end
