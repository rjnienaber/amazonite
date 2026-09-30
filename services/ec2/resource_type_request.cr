private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # A resource type to check for image references. Associated options can also be specified if the
  # resource type is an EC2 instance or launch template.
  class ResourceTypeRequest
    # The resource type.
    property resource_type : ImageReferenceResourceType | Nil

    # The options that affect the scope of the response. Valid only when `ResourceType` is
    # `ec2:Instance` or `ec2:LaunchTemplate`.
    property resource_type_options : Array(ResourceTypeOption) | Nil

    def initialize(
      @resource_type : ImageReferenceResourceType | Nil = nil,
      @resource_type_options : Array(ResourceTypeOption) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @resource_type
        params << {"#{prefix}ResourceType", value.to_json_object_key}
      end

      (@resource_type_options || [] of ResourceTypeOption).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ResourceTypeOption.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource_type: (n = node.xpath_node("*[local-name()='ResourceType']")) ? AEC::ImageReferenceResourceType.from_json_object_key?(n.content) : nil,
        resource_type_options: node.xpath_nodes("*[local-name()='ResourceTypeOption']/*[local-name()='item']").map { |n| ResourceTypeOption.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @resource_type_options
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@resource_type, @resource_type_options)
  end
end
