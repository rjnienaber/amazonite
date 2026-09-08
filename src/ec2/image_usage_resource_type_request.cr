private alias Core = Amazonite::Core

module Amazonite::EC2
  # A resource type to include in the report. Associated options can also be specified if the
  # resource type is a launch template.
  class ImageUsageResourceTypeRequest
    # The resource type.
    #
    # Valid values: `ec2:Instance` | `ec2:LaunchTemplate`
    property resource_type : String | Nil

    # The options that affect the scope of the report. Valid only when `ResourceType` is
    # `ec2:LaunchTemplate`.
    property resource_type_options : Array(ImageUsageResourceTypeOptionRequest) | Nil

    def initialize(
      @resource_type : String | Nil = nil,
      @resource_type_options : Array(ImageUsageResourceTypeOptionRequest) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @resource_type
        params << {"#{prefix}ResourceType", value}
      end

      (@resource_type_options || [] of ImageUsageResourceTypeOptionRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ResourceTypeOption.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource_type: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceType']")),
        resource_type_options: node.xpath_nodes("*[local-name()='ResourceTypeOption']/*[local-name()='item']").map { |n| ImageUsageResourceTypeOptionRequest.from_xml(n) },
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
