private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a tag.
  class TagDescription
    # The tag key.
    property key : String | Nil

    # The ID of the resource.
    property resource_id : String | Nil

    # The resource type.
    property resource_type : ResourceType | Nil

    # The tag value.
    property value : String | Nil

    def initialize(
      @key : String | Nil = nil,
      @resource_id : String | Nil = nil,
      @resource_type : ResourceType | Nil = nil,
      @value : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @key
        params << {"#{prefix}Key", value}
      end

      if value = @resource_id
        params << {"#{prefix}ResourceId", value}
      end

      if value = @resource_type
        params << {"#{prefix}ResourceType", value.to_json_object_key}
      end

      if value = @value
        params << {"#{prefix}Value", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        key: Core::XMLValue.string(node.xpath_node("*[local-name()='key']")),
        resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceId']")),
        resource_type: (n = node.xpath_node("*[local-name()='resourceType']")) ? AEC::ResourceType.from_json_object_key?(n.content) : nil,
        value: Core::XMLValue.string(node.xpath_node("*[local-name()='value']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@key, @resource_id, @resource_type, @value)
  end
end
