private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListHookResultsInput
    property target_type : ListHookResultsTargetType | Nil

    property target_id : String | Nil

    property type_arn : String | Nil

    property status : HookStatus | Nil

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
  end
end
