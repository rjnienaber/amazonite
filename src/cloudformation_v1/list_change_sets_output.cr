private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The output for the ListChangeSets action.
  class ListChangeSetsOutput
    # A list of `ChangeSetSummary` structures that provides the ID and status of each change set for
    # the specified stack.
    property summaries : Array(ChangeSetSummary) | Nil

    # If the output exceeds 1 MB, a string that identifies the next page of change sets. If there is
    # no additional page, this value is `null`.
    property next_token : String | Nil

    def initialize(
      @summaries : Array(ChangeSetSummary) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@summaries || [] of ChangeSetSummary).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Summaries.member.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        summaries: node.xpath_nodes("*[local-name()='Summaries']/*[local-name()='member']").map { |n| ChangeSetSummary.from_xml(n) },
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
