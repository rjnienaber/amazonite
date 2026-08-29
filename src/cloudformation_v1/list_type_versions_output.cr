private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListTypeVersionsOutput
    property type_version_summaries : Array(TypeVersionSummary) | Nil

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
  end
end
