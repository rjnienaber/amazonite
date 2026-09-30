private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeInstanceImageMetadataResult
    # Information about the instance and the AMI used to launch the instance.
    property instance_image_metadata : Array(InstanceImageMetadata) | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    def initialize(
      @instance_image_metadata : Array(InstanceImageMetadata) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@instance_image_metadata || [] of InstanceImageMetadata).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}InstanceImageMetadataSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_image_metadata: node.xpath_nodes("*[local-name()='instanceImageMetadataSet']/*[local-name()='item']").map { |n| InstanceImageMetadata.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @instance_image_metadata
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@instance_image_metadata, @next_token)
  end
end
