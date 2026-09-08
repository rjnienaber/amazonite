private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # A single resource's tag configuration associated with the Flow Logs Amazon EC2 Tags feature
  # fields in your custom log format.
  class TagFieldSpecificationResponse
    # The resource type for the tag keys associated with the Flow Logs Amazon EC2 Tags feature fields
    # in your custom log format.
    property resource_type : TaggableResourceType | Nil

    # The tag keys on your tagged resources to be displayed by the Flow Logs Amazon EC2 Tags feature
    # fields in your custom log format.
    property tag_keys : Array(String) | Nil

    def initialize(
      @resource_type : TaggableResourceType | Nil = nil,
      @tag_keys : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @resource_type
        params << {"#{prefix}ResourceType", value.to_json_object_key}
      end

      (@tag_keys || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}TagKeySet.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource_type: (n = node.xpath_node("*[local-name()='resourceType']")) ? AEC::TaggableResourceType.from_json_object_key?(n.content) : nil,
        tag_keys: node.xpath_nodes("*[local-name()='tagKeySet']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
      if value = @tag_keys
        raise Core::ValidationError.new("TagKeys must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("TagKeys must have at most 2 item(s)") if value.size > 2
      end
    end

    def_equals_and_hash(@resource_type, @tag_keys)
  end
end
