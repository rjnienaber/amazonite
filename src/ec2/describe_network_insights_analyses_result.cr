private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeNetworkInsightsAnalysesResult
    # Information about the network insights analyses.
    property network_insights_analyses : Array(NetworkInsightsAnalysis) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @network_insights_analyses : Array(NetworkInsightsAnalysis) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@network_insights_analyses || [] of NetworkInsightsAnalysis).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}NetworkInsightsAnalysisSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_insights_analyses: node.xpath_nodes("*[local-name()='networkInsightsAnalysisSet']/*[local-name()='item']").map { |n| NetworkInsightsAnalysis.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @network_insights_analyses
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@network_insights_analyses, @next_token)
  end
end
