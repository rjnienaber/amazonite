private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class PolicyGrantingServiceAccess
    property policy_name : String

    property policy_type : PolicyType

    property policy_arn : String | Nil

    property entity_type : PolicyOwnerEntityType | Nil

    property entity_name : String | Nil

    def initialize(
      @policy_name : String,
      @policy_type : PolicyType,
      @policy_arn : String | Nil = nil,
      @entity_type : PolicyOwnerEntityType | Nil = nil,
      @entity_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}PolicyName", @policy_name}

      params << {"#{prefix}PolicyType", @policy_type.to_json_object_key}

      if value = @policy_arn
        params << {"#{prefix}PolicyArn", value}
      end

      if value = @entity_type
        params << {"#{prefix}EntityType", value.to_json_object_key}
      end

      if value = @entity_name
        params << {"#{prefix}EntityName", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy_name: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyName']")).not_nil!,
        policy_type: ((n = node.xpath_node("*[local-name()='PolicyType']")) ? AI::PolicyType.from_json_object_key?(n.content) : nil).not_nil!,
        policy_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyArn']")),
        entity_type: (n = node.xpath_node("*[local-name()='EntityType']")) ? AI::PolicyOwnerEntityType.from_json_object_key?(n.content) : nil,
        entity_name: Core::XMLValue.string(node.xpath_node("*[local-name()='EntityName']")),
      )
    end
  end
end
