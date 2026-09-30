private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetNetworkInsightsAccessScopeAnalysisFindingsResult
    # The ID of the Network Access Scope analysis.
    property network_insights_access_scope_analysis_id : String | Nil

    # The status of Network Access Scope Analysis.
    property analysis_status : AnalysisStatus | Nil

    # The findings associated with Network Access Scope Analysis.
    property analysis_findings : Array(AccessScopeAnalysisFinding) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @network_insights_access_scope_analysis_id : String | Nil = nil,
      @analysis_status : AnalysisStatus | Nil = nil,
      @analysis_findings : Array(AccessScopeAnalysisFinding) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @network_insights_access_scope_analysis_id
        params << {"#{prefix}NetworkInsightsAccessScopeAnalysisId", value}
      end

      if value = @analysis_status
        params << {"#{prefix}AnalysisStatus", value.to_json_object_key}
      end

      (@analysis_findings || [] of AccessScopeAnalysisFinding).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AnalysisFindingSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_insights_access_scope_analysis_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInsightsAccessScopeAnalysisId']")),
        analysis_status: (n = node.xpath_node("*[local-name()='analysisStatus']")) ? AEC::AnalysisStatus.from_json_object_key?(n.content) : nil,
        analysis_findings: node.xpath_nodes("*[local-name()='analysisFindingSet']/*[local-name()='item']").map { |n| AccessScopeAnalysisFinding.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @analysis_findings
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@network_insights_access_scope_analysis_id, @analysis_status, @analysis_findings, @next_token)
  end
end
