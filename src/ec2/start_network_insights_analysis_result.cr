private alias Core = Amazonite::Core

module Amazonite::EC2
  class StartNetworkInsightsAnalysisResult
    # Information about the network insights analysis.
    property network_insights_analysis : NetworkInsightsAnalysis | Nil

    def initialize(
      @network_insights_analysis : NetworkInsightsAnalysis | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @network_insights_analysis
        params.concat(value.to_query_params("#{prefix}NetworkInsightsAnalysis."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_insights_analysis: node.xpath_node("*[local-name()='networkInsightsAnalysis']").try { |n| NetworkInsightsAnalysis.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @network_insights_analysis
        value.validate!
      end
    end

    def_equals_and_hash(@network_insights_analysis)
  end
end
