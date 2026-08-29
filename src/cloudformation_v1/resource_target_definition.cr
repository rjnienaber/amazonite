private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ResourceTargetDefinition
    property attribute : ResourceAttribute | Nil

    property name : String | Nil

    property requires_recreation : RequiresRecreation | Nil

    property path : String | Nil

    property before_value : String | Nil

    property after_value : String | Nil

    property before_value_from : BeforeValueFrom | Nil

    property after_value_from : AfterValueFrom | Nil

    property drift : LiveResourceDrift | Nil

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
