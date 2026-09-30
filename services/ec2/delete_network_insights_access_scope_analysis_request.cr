private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteNetworkInsightsAccessScopeAnalysisRequest
    # The ID of the Network Access Scope analysis.
    property network_insights_access_scope_analysis_id : String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @network_insights_access_scope_analysis_id : String,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}NetworkInsightsAccessScopeAnalysisId", @network_insights_access_scope_analysis_id}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_insights_access_scope_analysis_id: Core::XMLValue.string(node.xpath_node("*[local-name()='NetworkInsightsAccessScopeAnalysisId']")).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@network_insights_access_scope_analysis_id, @dry_run)
  end
end
