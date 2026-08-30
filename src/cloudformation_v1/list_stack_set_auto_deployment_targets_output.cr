private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListStackSetAutoDeploymentTargetsOutput
    # An array of summaries of the deployment targets for the StackSet.
    property summaries : Array(StackSetAutoDeploymentTargetSummary) | Nil

    # If the request doesn't return all the remaining results, `NextToken` is set to a token. To
    # retrieve the next set of results, call
    # [ListStackSetAutoDeploymentTargets](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ListStackSetAutoDeploymentTargets.html)
    # again and use that value for the `NextToken` parameter. If the request returns all results,
    # `NextToken` is set to an empty string.
    property next_token : String | Nil

    def initialize(
      @summaries : Array(StackSetAutoDeploymentTargetSummary) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@summaries || [] of StackSetAutoDeploymentTargetSummary).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Summaries.member.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        summaries: node.xpath_nodes("*[local-name()='Summaries']/*[local-name()='member']").map { |n| StackSetAutoDeploymentTargetSummary.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end
  end
end
