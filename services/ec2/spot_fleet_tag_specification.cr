private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The tags for a Spot Fleet resource.
  class SpotFleetTagSpecification
    # The type of resource. Currently, the only resource type that is supported is `instance`. To tag
    # the Spot Fleet request on creation, use the `TagSpecifications` parameter in `
    # [SpotFleetRequestConfigData](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_SpotFleetRequestConfigData.html)
    # `.
    property resource_type : ResourceType | Nil

    # The tags.
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
        resource_type: (n = node.xpath_node("*[local-name()='resourceType']")) ? AEC::ResourceType.from_json_object_key?(n.content) : nil,
        tags: node.xpath_nodes("*[local-name()='tag']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
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
