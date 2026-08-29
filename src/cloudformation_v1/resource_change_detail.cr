private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ResourceChangeDetail
    property target : ResourceTargetDefinition | Nil

    property evaluation : EvaluationType | Nil

    property change_source : ChangeSource | Nil

    property causing_entity : String | Nil

    def initialize(
      @target : ResourceTargetDefinition | Nil = nil,
      @evaluation : EvaluationType | Nil = nil,
      @change_source : ChangeSource | Nil = nil,
      @causing_entity : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @target
        params.concat(value.to_query_params("#{prefix}Target."))
      end

      if value = @evaluation
        params << {"#{prefix}Evaluation", value.to_json_object_key}
      end

      if value = @change_source
        params << {"#{prefix}ChangeSource", value.to_json_object_key}
      end

      if value = @causing_entity
        params << {"#{prefix}CausingEntity", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        target: node.xpath_node("*[local-name()='Target']").try { |n| ResourceTargetDefinition.from_xml(n) },
        evaluation: (n = node.xpath_node("*[local-name()='Evaluation']")) ? ACF::EvaluationType.from_json_object_key?(n.content) : nil,
        change_source: (n = node.xpath_node("*[local-name()='ChangeSource']")) ? ACF::ChangeSource.from_json_object_key?(n.content) : nil,
        causing_entity: Core::XMLValue.string(node.xpath_node("*[local-name()='CausingEntity']")),
      )
    end
  end
end
