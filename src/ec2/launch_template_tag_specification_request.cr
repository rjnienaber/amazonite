private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The tags specification for the resources that are created during instance launch.
  class LaunchTemplateTagSpecificationRequest
    # The type of resource to tag.
    #
    # Valid Values lists all resource types for Amazon EC2 that can be tagged. When you create a
    # launch template, you can specify tags for the following resource types only: `instance` |
    # `volume` | `network-interface` | `spot-instances-request`. If the instance does not include the
    # resource type that you specify, the instance launch fails. For example, not all instance types
    # include a volume.
    #
    # To tag a resource after it has been created, see
    # [CreateTags](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateTags.html).
    property resource_type : ResourceType | Nil

    # The tags to apply to the resource.
    property tags : Array(Tag) | Nil

    def initialize(
      @resource_type : ResourceType | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @resource_type
        params << {"#{prefix}ResourceType", value.to_json_object_key}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tag.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource_type: (n = node.xpath_node("*[local-name()='ResourceType']")) ? AEC::ResourceType.from_json_object_key?(n.content) : nil,
        tags: node.xpath_nodes("*[local-name()='Tag']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@resource_type, @tags)
  end
end
