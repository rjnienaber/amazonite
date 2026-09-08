private alias Core = Amazonite::Core

module Amazonite::EC2
  class StartNetworkInsightsAccessScopeAnalysisResult
    # The Network Access Scope analysis.
    property network_insights_access_scope_analysis : NetworkInsightsAccessScopeAnalysis | Nil

    def initialize(
      @network_insights_access_scope_analysis : NetworkInsightsAccessScopeAnalysis | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @network_insights_access_scope_analysis
        params.concat(value.to_query_params("#{prefix}NetworkInsightsAccessScopeAnalysis."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_insights_access_scope_analysis: node.xpath_node("*[local-name()='networkInsightsAccessScopeAnalysis']").try { |n| NetworkInsightsAccessScopeAnalysis.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @network_insights_access_scope_analysis
        value.validate!
      end
    end

    def_equals_and_hash(@network_insights_access_scope_analysis)
  end
end
