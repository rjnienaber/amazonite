private alias AI = Amazonite::Iam
private alias Core = Amazonite::Core

module Amazonite::Iam
  # Contains information about a condition context key. It includes the name of the key and
  # specifies the value (or values, if the context key supports multiple values) to use in the
  # simulation. This information is used when evaluating the `Condition` elements of the input
  # policies.
  #
  # This data type is used as an input parameter to
  # [SimulateCustomPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_SimulateCustomPolicy.html)
  # and
  # [SimulatePrincipalPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_SimulatePrincipalPolicy.html).
  class ContextEntry
    # The full name of a condition context key, including the service prefix. For example,
    # `aws:SourceIp` or `s3:VersionId`.
    property context_key_name : String | Nil

    # The value (or values, if the condition context key supports multiple values) to provide to the
    # simulation when the key is referenced by a `Condition` element in an input policy.
    property context_key_values : Array(String) | Nil

    # The data type of the value (or values) specified in the `ContextKeyValues` parameter.
    property context_key_type : ContextKeyTypeEnum | Nil

    def initialize(
      @context_key_name : String | Nil = nil,
      @context_key_values : Array(String) | Nil = nil,
      @context_key_type : ContextKeyTypeEnum | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @context_key_name
        params << {"#{prefix}ContextKeyName", value}
      end

      (@context_key_values || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ContextKeyValues.member.#{i}", item}
      end

      if value = @context_key_type
        params << {"#{prefix}ContextKeyType", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        context_key_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ContextKeyName']")),
        context_key_values: node.xpath_nodes("*[local-name()='ContextKeyValues']/*[local-name()='member']").map { |n| n.content },
        context_key_type: (n = node.xpath_node("*[local-name()='ContextKeyType']")) ? AI::ContextKeyTypeEnum.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @context_key_name
        raise Core::ValidationError.new("ContextKeyName length must be >= 5") if value.size < 5
        raise Core::ValidationError.new("ContextKeyName length must be <= 256") if value.size > 256
      end
    end

    def_equals_and_hash(@context_key_name, @context_key_values, @context_key_type)
  end
end
