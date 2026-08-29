private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListGeneratedTemplatesOutput
    property summaries : Array(TemplateSummary) | Nil

    property next_token : String | Nil

    def initialize(
      @summaries : Array(TemplateSummary) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@summaries || [] of TemplateSummary).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Summaries.member.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        summaries: node.xpath_nodes("*[local-name()='Summaries']/*[local-name()='member']").map { |n| TemplateSummary.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end
  end
end
