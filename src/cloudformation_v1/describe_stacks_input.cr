private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The input for DescribeStacks action.
  class DescribeStacksInput
    # If you don't pass a parameter to `StackName`, the API returns a response that describes all
    # resources in the account, which can impact performance. This requires `ListStacks` and
    # `DescribeStacks` permissions.
    #
    # Consider using the ListStacks API if you're not passing a parameter to `StackName`.
    #
    # The IAM policy below can be added to IAM policies when you want to limit resource-level
    # permissions and avoid returning a response when no parameter is sent in the request:
    #
    # { "Version": "2012-10-17", "Statement": [{ "Effect": "Deny", "Action":
    # "cloudformation:DescribeStacks", "NotResource": "arn:aws:cloudformation:*:*:stack/*/*" }] }
    #
    # The name or the unique stack ID that's associated with the stack, which aren't always
    # interchangeable:
    #
    # - Running stacks: You can specify either the stack's name or its unique stack ID.
    #
    # - Deleted stacks: You must specify the unique stack ID.
    property stack_name : String | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    property next_token : String | Nil

    def initialize(
      @stack_name : String | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @stack_name
        params << {"#{prefix}StackName", value}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def validate! : Nil
      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@stack_name, @next_token)
  end
end
