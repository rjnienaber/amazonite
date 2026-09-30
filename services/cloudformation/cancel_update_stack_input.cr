private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # The input for the CancelUpdateStack action.
  class CancelUpdateStackInput
    # If you don't pass a parameter to `StackName`, the API returns a response that describes all
    # resources in the account.
    #
    # The IAM policy below can be added to IAM policies when you want to limit resource-level
    # permissions and avoid returning a response when no parameter is sent in the request:
    #
    # `{ "Version": "2012-10-17", "Statement": [{ "Effect": "Deny", "Action":
    # "cloudformation:DescribeStacks", "NotResource": "arn:aws:cloudformation:*:*:stack/*/*" }] }`
    #
    # The name or the unique stack ID that's associated with the stack.
    property stack_name : String

    # A unique identifier for this `CancelUpdateStack` request. Specify this token if you plan to
    # retry requests so that CloudFormation knows that you're not attempting to cancel an update on a
    # stack with the same name. You might retry `CancelUpdateStack` requests to ensure that
    # CloudFormation successfully received them.
    property client_request_token : String | Nil

    def initialize(
      @stack_name : String,
      @client_request_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackName", @stack_name}

      if value = @client_request_token
        params << {"#{prefix}ClientRequestToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")).not_nil!,
        client_request_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientRequestToken']")),
      )
    end

    def validate! : Nil
      if value = @client_request_token
        raise Core::ValidationError.new("ClientRequestToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ClientRequestToken length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("ClientRequestToken does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9][-a-zA-Z0-9]*$"))
      end
    end

    def_equals_and_hash(@stack_name, @client_request_token)
  end
end
