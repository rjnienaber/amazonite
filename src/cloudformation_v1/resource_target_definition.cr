private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The field that CloudFormation will change, such as the name of a resource's property, and
  # whether the resource will be recreated.
  class ResourceTargetDefinition
    # Indicates which resource attribute is triggering this update, such as a change in the resource
    # attribute's `Metadata`, `Properties`, or `Tags`.
    property attribute : ResourceAttribute | Nil

    # If the `Attribute` value is `Properties`, the name of the property. For all other attributes,
    # the value is null.
    property name : String | Nil

    # If the `Attribute` value is `Properties`, indicates whether a change to this property causes the
    # resource to be recreated. The value can be `Never`, `Always`, or `Conditionally`. To determine
    # the conditions for a `Conditionally` recreation, see the update behavior for that property in
    # the [Amazon Web Services resource and property types
    # reference](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html)
    # in the *CloudFormation User Guide*.
    property requires_recreation : RequiresRecreation | Nil

    # The property path of the property.
    property path : String | Nil

    # The value of the property before the change is executed. Large values can be truncated.
    property before_value : String | Nil

    # The value of the property after the change is executed. Large values can be truncated.
    property after_value : String | Nil

    # Indicates the source of the before value. Valid values:
    #
    # - `ACTUAL_STATE` – The before value represents current actual state.
    #
    # - `PREVIOUS_DEPLOYMENT_STATE` – The before value represents the previous CloudFormation
    # deployment state.
    #
    # Only present for drift-aware change sets.
    property before_value_from : BeforeValueFrom | Nil

    # Indicates the source of the after value. Valid value:
    #
    # - `TEMPLATE` – The after value comes from the new template.
    #
    # Only present for drift-aware change sets.
    property after_value_from : AfterValueFrom | Nil

    # Detailed drift information for the resource property, including actual values, previous
    # deployment values, and drift detection timestamps.
    property drift : LiveResourceDrift | Nil

    # The type of change to be made to the property if the change is executed.
    #
    # - `Add` The item will be added.
    #
    # - `Remove` The item will be removed.
    #
    # - `Modify` The item will be modified.
    #
    # - `SyncWithActual` The drift status of this item will be reset but the item will not be
    # modified.
    property attribute_change_type : AttributeChangeType | Nil

    def initialize(
      @attribute : ResourceAttribute | Nil = nil,
      @name : String | Nil = nil,
      @requires_recreation : RequiresRecreation | Nil = nil,
      @path : String | Nil = nil,
      @before_value : String | Nil = nil,
      @after_value : String | Nil = nil,
      @before_value_from : BeforeValueFrom | Nil = nil,
      @after_value_from : AfterValueFrom | Nil = nil,
      @drift : LiveResourceDrift | Nil = nil,
      @attribute_change_type : AttributeChangeType | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @attribute
        params << {"#{prefix}Attribute", value.to_json_object_key}
      end

      if value = @name
        params << {"#{prefix}Name", value}
      end

      if value = @requires_recreation
        params << {"#{prefix}RequiresRecreation", value.to_json_object_key}
      end

      if value = @path
        params << {"#{prefix}Path", value}
      end

      if value = @before_value
        params << {"#{prefix}BeforeValue", value}
      end

      if value = @after_value
        params << {"#{prefix}AfterValue", value}
      end

      if value = @before_value_from
        params << {"#{prefix}BeforeValueFrom", value.to_json_object_key}
      end

      if value = @after_value_from
        params << {"#{prefix}AfterValueFrom", value.to_json_object_key}
      end

      if value = @drift
        params.concat(value.to_query_params("#{prefix}Drift."))
      end

      if value = @attribute_change_type
        params << {"#{prefix}AttributeChangeType", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        attribute: (n = node.xpath_node("*[local-name()='Attribute']")) ? ACF::ResourceAttribute.from_json_object_key?(n.content) : nil,
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='Name']")),
        requires_recreation: (n = node.xpath_node("*[local-name()='RequiresRecreation']")) ? ACF::RequiresRecreation.from_json_object_key?(n.content) : nil,
        path: Core::XMLValue.string(node.xpath_node("*[local-name()='Path']")),
        before_value: Core::XMLValue.string(node.xpath_node("*[local-name()='BeforeValue']")),
        after_value: Core::XMLValue.string(node.xpath_node("*[local-name()='AfterValue']")),
        before_value_from: (n = node.xpath_node("*[local-name()='BeforeValueFrom']")) ? ACF::BeforeValueFrom.from_json_object_key?(n.content) : nil,
        after_value_from: (n = node.xpath_node("*[local-name()='AfterValueFrom']")) ? ACF::AfterValueFrom.from_json_object_key?(n.content) : nil,
        drift: node.xpath_node("*[local-name()='Drift']").try { |n| LiveResourceDrift.from_xml(n) },
        attribute_change_type: (n = node.xpath_node("*[local-name()='AttributeChangeType']")) ? ACF::AttributeChangeType.from_json_object_key?(n.content) : nil,
      )
    end
  end
end
