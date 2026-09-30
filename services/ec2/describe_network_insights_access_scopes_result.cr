private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeNetworkInsightsAccessScopesResult
    # The Network Access Scopes.
    property network_insights_access_scopes : Array(NetworkInsightsAccessScope) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @network_insights_access_scopes : Array(NetworkInsightsAccessScope) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@network_insights_access_scopes || [] of NetworkInsightsAccessScope).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}NetworkInsightsAccessScopeSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_insights_access_scopes: node.xpath_nodes("*[local-name()='networkInsightsAccessScopeSet']/*[local-name()='item']").map { |n| NetworkInsightsAccessScope.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @network_insights_access_scopes
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@network_insights_access_scopes, @next_token)
  end
end
