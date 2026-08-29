private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribeStackResourceDriftsOutput
    # Drift information for the resources that have been checked for drift in the specified stack.
    # This includes actual and expected configuration values for resources where CloudFormation
    # detects drift.
    #
    # For a given stack, there will be one `StackResourceDrift` for each stack resource that has been
    # checked for drift. Resources that haven't yet been checked for drift aren't included. Resources
    # that do not currently support drift detection aren't checked, and so not included. For a list of
    # resources that support drift detection, see [Resource type support for imports and drift
    # detection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import-supported-resources.html).
    property stack_resource_drifts : Array(StackResourceDrift) = [] of StackResourceDrift

    # If the request doesn't return all the remaining results, `NextToken` is set to a token. To
    # retrieve the next set of results, call `DescribeStackResourceDrifts` again and assign that token
    # to the request object's `NextToken` parameter. If the request returns all results, `NextToken`
    # is set to `null`.
    property next_token : String | Nil

    def initialize(
      @stack_resource_drifts : Array(StackResourceDrift),
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @stack_resource_drifts.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}StackResourceDrifts.member.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_resource_drifts: node.xpath_nodes("*[local-name()='StackResourceDrifts']/*[local-name()='member']").map { |n| StackResourceDrift.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end
  end
end
