private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The input for the ExecuteChangeSet action.
  class ExecuteChangeSetInput
    # The name or Amazon Resource Name (ARN) of the change set that you want use to update the
    # specified stack.
    property change_set_name : String

    # If you specified the name of a change set, specify the stack name or Amazon Resource Name (ARN)
    # that's associated with the change set you want to execute.
    property stack_name : String | Nil

    # A unique identifier for this `ExecuteChangeSet` request. Specify this token if you plan to retry
    # requests so that CloudFormation knows that you're not attempting to execute a change set to
    # update a stack with the same name. You might retry `ExecuteChangeSet` requests to ensure that
    # CloudFormation successfully received them.
    property client_request_token : String | Nil

    # Preserves the state of previously provisioned resources when an operation fails. This parameter
    # can't be specified when the `OnStackFailure` parameter to the
    # [CreateChangeSet](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_CreateChangeSet.html)
    # API operation was specified.
    #
    # - `True` - if the stack creation fails, do nothing. This is equivalent to specifying
    # `DO_NOTHING` for the `OnStackFailure` parameter to the
    # [CreateChangeSet](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_CreateChangeSet.html)
    # API operation.
    #
    # - `False` - if the stack creation fails, roll back the stack. This is equivalent to specifying
    # `ROLLBACK` for the `OnStackFailure` parameter to the
    # [CreateChangeSet](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_CreateChangeSet.html)
    # API operation.
    #
    # Default: `True`
    property disable_rollback : Bool | Nil

    # When set to `true`, newly created resources are deleted when the operation rolls back. This
    # includes newly created resources marked with a deletion policy of `Retain`.
    #
    # Default: `false`
    property retain_except_on_create : Bool | Nil

    def initialize(
      @change_set_name : String,
      @stack_name : String | Nil = nil,
      @client_request_token : String | Nil = nil,
      @disable_rollback : Bool | Nil = nil,
      @retain_except_on_create : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ChangeSetName", @change_set_name}

      if value = @stack_name
        params << {"#{prefix}StackName", value}
      end

      if value = @client_request_token
        params << {"#{prefix}ClientRequestToken", value}
      end

      if value = @disable_rollback
        params << {"#{prefix}DisableRollback", Core::QueryValue.bool(value)}
      end

      if value = @retain_except_on_create
        params << {"#{prefix}RetainExceptOnCreate", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        change_set_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ChangeSetName']")).not_nil!,
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")),
        client_request_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientRequestToken']")),
        disable_rollback: Core::XMLValue.bool(node.xpath_node("*[local-name()='DisableRollback']")),
        retain_except_on_create: Core::XMLValue.bool(node.xpath_node("*[local-name()='RetainExceptOnCreate']")),
      )
    end

    def validate! : Nil
      if value = @change_set_name
        raise Core::ValidationError.new("ChangeSetName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ChangeSetName length must be <= 1600") if value.size > 1600
        raise Core::ValidationError.new("ChangeSetName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z][-a-zA-Z0-9]*|arn:[-a-zA-Z0-9:/]*$"))
      end

      if value = @stack_name
        raise Core::ValidationError.new("StackName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StackName does not match the required pattern") unless value.matches?(Regex.new("^([a-zA-Z][-a-zA-Z0-9]*)|(arn:\\b(aws|aws-us-gov|aws-cn)\\b:[-a-zA-Z0-9:/._+]*)$"))
      end

      if value = @client_request_token
        raise Core::ValidationError.new("ClientRequestToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ClientRequestToken length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("ClientRequestToken does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9][-a-zA-Z0-9]*$"))
      end
    end

    def_equals_and_hash(@change_set_name, @stack_name, @client_request_token, @disable_rollback, @retain_except_on_create)
  end
end
