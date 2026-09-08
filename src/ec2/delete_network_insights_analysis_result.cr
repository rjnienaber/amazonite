private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteNetworkInsightsAnalysisResult
    # The ID of the network insights analysis.
    property network_insights_analysis_id : String | Nil

    def initialize(
      @network_insights_analysis_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @network_insights_analysis_id
        params << {"#{prefix}NetworkInsightsAnalysisId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_insights_analysis_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInsightsAnalysisId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@network_insights_analysis_id)
  end
end
