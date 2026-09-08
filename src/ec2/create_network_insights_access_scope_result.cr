private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateNetworkInsightsAccessScopeResult
    # The Network Access Scope.
    property network_insights_access_scope : NetworkInsightsAccessScope | Nil

    # The Network Access Scope content.
    property network_insights_access_scope_content : NetworkInsightsAccessScopeContent | Nil

    def initialize(
      @network_insights_access_scope : NetworkInsightsAccessScope | Nil = nil,
      @network_insights_access_scope_content : NetworkInsightsAccessScopeContent | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @network_insights_access_scope
        params.concat(value.to_query_params("#{prefix}NetworkInsightsAccessScope."))
      end

      if value = @network_insights_access_scope_content
        params.concat(value.to_query_params("#{prefix}NetworkInsightsAccessScopeContent."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_insights_access_scope: node.xpath_node("*[local-name()='networkInsightsAccessScope']").try { |n| NetworkInsightsAccessScope.from_xml(n) },
        network_insights_access_scope_content: node.xpath_node("*[local-name()='networkInsightsAccessScopeContent']").try { |n| NetworkInsightsAccessScopeContent.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @network_insights_access_scope
        value.validate!
      end

      if value = @network_insights_access_scope_content
        value.validate!
      end
    end

    def_equals_and_hash(@network_insights_access_scope, @network_insights_access_scope_content)
  end
end
