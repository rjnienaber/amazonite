private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListTypesOutput
    # A list of `TypeSummary` structures that contain information about the specified extensions.
    property type_summaries : Array(TypeSummary) | Nil

    # If the request doesn't return all the remaining results, `NextToken` is set to a token. To
    # retrieve the next set of results, call this action again and assign that token to the request
    # object's `NextToken` parameter. If the request returns all results, `NextToken` is set to
    # `null`.
    property next_token : String | Nil

    def initialize(
      @type_summaries : Array(TypeSummary) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@type_summaries || [] of TypeSummary).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TypeSummaries.member.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type_summaries: node.xpath_nodes("*[local-name()='TypeSummaries']/*[local-name()='member']").map { |n| TypeSummary.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def_equals_and_hash(@type_summaries, @next_token)
  end
end
