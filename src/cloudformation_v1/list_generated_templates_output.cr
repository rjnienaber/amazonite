private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListGeneratedTemplatesOutput
    # A list of summaries of the generated templates.
    property summaries : Array(TemplateSummary) | Nil

    # If the request doesn't return all the remaining results, `NextToken` is set to a token. To
    # retrieve the next set of results, call `ListGeneratedTemplates` again and use that value for the
    # `NextToken` parameter. If the request returns all results, `NextToken` is set to an empty
    # string.
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

    def validate! : Nil
      if value = @summaries
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@summaries, @next_token)
  end
end
