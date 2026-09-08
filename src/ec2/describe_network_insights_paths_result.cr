private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeNetworkInsightsPathsResult
    # Information about the paths.
    property network_insights_paths : Array(NetworkInsightsPath) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @network_insights_paths : Array(NetworkInsightsPath) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@network_insights_paths || [] of NetworkInsightsPath).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}NetworkInsightsPathSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_insights_paths: node.xpath_nodes("*[local-name()='networkInsightsPathSet']/*[local-name()='item']").map { |n| NetworkInsightsPath.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @network_insights_paths
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@network_insights_paths, @next_token)
  end
end
