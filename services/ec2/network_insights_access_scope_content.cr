private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the Network Access Scope content.
  class NetworkInsightsAccessScopeContent
    # The ID of the Network Access Scope.
    property network_insights_access_scope_id : String | Nil

    # The paths to match.
    property match_paths : Array(AccessScopePath) | Nil

    # The paths to exclude.
    property exclude_paths : Array(AccessScopePath) | Nil

    def initialize(
      @network_insights_access_scope_id : String | Nil = nil,
      @match_paths : Array(AccessScopePath) | Nil = nil,
      @exclude_paths : Array(AccessScopePath) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @network_insights_access_scope_id
        params << {"#{prefix}NetworkInsightsAccessScopeId", value}
      end

      (@match_paths || [] of AccessScopePath).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}MatchPathSet.#{i}."))
      end

      (@exclude_paths || [] of AccessScopePath).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ExcludePathSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_insights_access_scope_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInsightsAccessScopeId']")),
        match_paths: node.xpath_nodes("*[local-name()='matchPathSet']/*[local-name()='item']").map { |n| AccessScopePath.from_xml(n) },
        exclude_paths: node.xpath_nodes("*[local-name()='excludePathSet']/*[local-name()='item']").map { |n| AccessScopePath.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @match_paths
        value.each(&.validate!)
      end

      if value = @exclude_paths
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@network_insights_access_scope_id, @match_paths, @exclude_paths)
  end
end
