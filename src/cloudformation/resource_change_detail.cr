private alias ACF = Amazonite::CloudFormation
private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # For a resource with `Modify` as the action, the `ResourceChange` structure describes the changes
  # CloudFormation will make to that resource.
  class ResourceChangeDetail
    # A `ResourceTargetDefinition` structure that describes the field that CloudFormation will change
    # and whether the resource will be recreated.
    property target : ResourceTargetDefinition | Nil

    # Indicates whether CloudFormation can determine the target value, and whether the target value
    # will change before you execute a change set.
    #
    # For `Static` evaluations, CloudFormation can determine that the target value will change, and
    # its value. For example, if you directly modify the `InstanceType` property of an EC2 instance,
    # CloudFormation knows that this property value will change, and its value, so this is a `Static`
    # evaluation.
    #
    # For `Dynamic` evaluations, can't determine the target value because it depends on the result of
    # an intrinsic function, such as a `Ref` or `Fn::GetAtt` intrinsic function, when the stack is
    # updated. For example, if your template includes a reference to a resource that's conditionally
    # recreated, the value of the reference (the physical ID of the resource) might change, depending
    # on if the resource is recreated. If the resource is recreated, it will have a new physical ID,
    # so all references to that resource will also be updated.
    property evaluation : EvaluationType | Nil

    # The group to which the `CausingEntity` value belongs. There are five entity groups:
    #
    # - `ResourceReference` entities are `Ref` intrinsic functions that refer to resources in the
    # template, such as `{ "Ref" : "MyEC2InstanceResource" }`.
    #
    # - `ParameterReference` entities are `Ref` intrinsic functions that get template parameter
    # values, such as `{ "Ref" : "MyPasswordParameter" }`.
    #
    # - `ResourceAttribute` entities are `Fn::GetAtt` intrinsic functions that get resource attribute
    # values, such as `{ "Fn::GetAtt" : [ "MyEC2InstanceResource", "PublicDnsName" ] }`.
    #
    # - `DirectModification` entities are changes that are made directly to the template.
    #
    # - `Automatic` entities are `AWS::CloudFormation::Stack` resource types, which are also known as
    # nested stacks. If you made no changes to the `AWS::CloudFormation::Stack` resource,
    # CloudFormation sets the `ChangeSource` to `Automatic` because the nested stack's template might
    # have changed. Changes to a nested stack's template aren't visible to CloudFormation until you
    # run an update on the parent stack.
    #
    # - `NoModification` entities are changes made to the template that matches the actual state of
    # the resource.
    property change_source : ChangeSource | Nil

    # The identity of the entity that triggered this change. This entity is a member of the group
    # that's specified by the `ChangeSource` field. For example, if you modified the value of the
    # `KeyPairName` parameter, the `CausingEntity` is the name of the parameter (`KeyPairName`).
    #
    # If the `ChangeSource` value is `DirectModification`, no value is given for `CausingEntity`.
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

    def validate! : Nil
      if value = @target
        value.validate!
      end
    end

    def_equals_and_hash(@target, @evaluation, @change_source, @causing_entity)
  end
end
