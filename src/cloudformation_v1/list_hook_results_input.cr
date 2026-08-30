private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListHookResultsInput
    # Filters results by target type. Currently, only `CHANGE_SET` and `CLOUD_CONTROL` are supported
    # filter options.
    #
    # Required when `TargetId` is specified and cannot be used otherwise.
    property target_type : ListHookResultsTargetType | Nil

    # Filters results by the unique identifier of the target the Hook was invoked against.
    #
    # For change sets, this is the change set ARN. When the target is a Cloud Control API operation,
    # this value must be the `HookRequestToken` returned by the Cloud Control API request. For more
    # information on the `HookRequestToken`, see
    # [ProgressEvent](https://docs.aws.amazon.com/cloudcontrolapi/latest/APIReference/API_ProgressEvent.html).
    #
    # Required when `TargetType` is specified and cannot be used otherwise.
    property target_id : String | Nil

    # Filters results by the ARN of the Hook. Can be used alone or in combination with `Status`.
    property type_arn : String | Nil

    # Filters results by the status of Hook invocations. Can only be used in combination with
    # `TypeArn`. Valid values are:
    #
    # - `HOOK_IN_PROGRESS`: The Hook is currently running.
    #
    # - `HOOK_COMPLETE_SUCCEEDED`: The Hook completed successfully.
    #
    # - `HOOK_COMPLETE_FAILED`: The Hook completed but failed validation.
    #
    # - `HOOK_FAILED`: The Hook encountered an error during execution.
    property status : HookStatus | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    property next_token : String | Nil

    def initialize(
      @target_type : ListHookResultsTargetType | Nil = nil,
      @target_id : String | Nil = nil,
      @type_arn : String | Nil = nil,
      @status : HookStatus | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @target_type
        params << {"#{prefix}TargetType", value.to_json_object_key}
      end

      if value = @target_id
        params << {"#{prefix}TargetId", value}
      end

      if value = @type_arn
        params << {"#{prefix}TypeArn", value}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        target_type: (n = node.xpath_node("*[local-name()='TargetType']")) ? ACF::ListHookResultsTargetType.from_json_object_key?(n.content) : nil,
        target_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TargetId']")),
        type_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeArn']")),
        status: (n = node.xpath_node("*[local-name()='Status']")) ? ACF::HookStatus.from_json_object_key?(n.content) : nil,
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def_equals_and_hash(@target_type, @target_id, @type_arn, @status, @next_token)
  end
end
