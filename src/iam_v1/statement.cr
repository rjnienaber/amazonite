private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class Statement
    property source_policy_id : String | Nil

    property source_policy_type : PolicySourceType | Nil

    property start_position : Position | Nil

    property end_position : Position | Nil

    def initialize(
      @source_policy_id : String | Nil = nil,
      @source_policy_type : PolicySourceType | Nil = nil,
      @start_position : Position | Nil = nil,
      @end_position : Position | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @source_policy_id
        params << {"#{prefix}SourcePolicyId", value}
      end

      if value = @source_policy_type
        params << {"#{prefix}SourcePolicyType", value.to_json_object_key}
      end

      if value = @start_position
        params.concat(value.to_query_params("#{prefix}StartPosition."))
      end

      if value = @end_position
        params.concat(value.to_query_params("#{prefix}EndPosition."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        source_policy_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SourcePolicyId']")),
        source_policy_type: (n = node.xpath_node("*[local-name()='SourcePolicyType']")) ? AI::PolicySourceType.from_json_object_key?(n.content) : nil,
        start_position: node.xpath_node("*[local-name()='StartPosition']").try { |n| Position.from_xml(n) },
        end_position: node.xpath_node("*[local-name()='EndPosition']").try { |n| Position.from_xml(n) },
      )
    end
  end
end
