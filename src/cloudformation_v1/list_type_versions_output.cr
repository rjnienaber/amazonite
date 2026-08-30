private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListTypeVersionsOutput
    # A list of `TypeVersionSummary` structures that contain information about the specified
    # extension's versions.
    property type_version_summaries : Array(TypeVersionSummary) | Nil

    # If the request doesn't return all of the remaining results, `NextToken` is set to a token. To
    # retrieve the next set of results, call this action again and assign that token to the request
    # object's `NextToken` parameter. If the request returns all results, `NextToken` is set to
    # `null`.
    property next_token : String | Nil

    def initialize(
      @type_version_summaries : Array(TypeVersionSummary) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@type_version_summaries || [] of TypeVersionSummary).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TypeVersionSummaries.member.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type_version_summaries: node.xpath_nodes("*[local-name()='TypeVersionSummaries']/*[local-name()='member']").map { |n| TypeVersionSummary.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def_equals_and_hash(@type_version_summaries, @next_token)
  end
end
