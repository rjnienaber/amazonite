private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a finding for a Network Access Scope.
  class AccessScopeAnalysisFinding
    # The ID of the Network Access Scope analysis.
    property network_insights_access_scope_analysis_id : String | Nil

    # The ID of the Network Access Scope.
    property network_insights_access_scope_id : String | Nil

    # The ID of the finding.
    property finding_id : String | Nil

    # The finding components.
    property finding_components : Array(PathComponent) | Nil

    def initialize(
      @network_insights_access_scope_analysis_id : String | Nil = nil,
      @network_insights_access_scope_id : String | Nil = nil,
      @finding_id : String | Nil = nil,
      @finding_components : Array(PathComponent) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @network_insights_access_scope_analysis_id
        params << {"#{prefix}NetworkInsightsAccessScopeAnalysisId", value}
      end

      if value = @network_insights_access_scope_id
        params << {"#{prefix}NetworkInsightsAccessScopeId", value}
      end

      if value = @finding_id
        params << {"#{prefix}FindingId", value}
      end

      (@finding_components || [] of PathComponent).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}FindingComponentSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_insights_access_scope_analysis_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInsightsAccessScopeAnalysisId']")),
        network_insights_access_scope_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInsightsAccessScopeId']")),
        finding_id: Core::XMLValue.string(node.xpath_node("*[local-name()='findingId']")),
        finding_components: node.xpath_nodes("*[local-name()='findingComponentSet']/*[local-name()='item']").map { |n| PathComponent.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @finding_components
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@network_insights_access_scope_analysis_id, @network_insights_access_scope_id, @finding_id, @finding_components)
  end
end
