private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # A resource that is referencing an image.
  class ImageReference
    # The ID of the referenced image.
    property image_id : String | Nil

    # The type of resource referencing the image.
    property resource_type : ImageReferenceResourceType | Nil

    # The Amazon Resource Name (ARN) of the resource referencing the image.
    property arn : String | Nil

    def initialize(
      @image_id : String | Nil = nil,
      @resource_type : ImageReferenceResourceType | Nil = nil,
      @arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @image_id
        params << {"#{prefix}ImageId", value}
      end

      if value = @resource_type
        params << {"#{prefix}ResourceType", value.to_json_object_key}
      end

      if value = @arn
        params << {"#{prefix}Arn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='imageId']")),
        resource_type: (n = node.xpath_node("*[local-name()='resourceType']")) ? AEC::ImageReferenceResourceType.from_json_object_key?(n.content) : nil,
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='arn']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@image_id, @resource_type, @arn)
  end
end
