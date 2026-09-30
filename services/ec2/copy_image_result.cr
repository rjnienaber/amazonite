private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the output of CopyImage.
  class CopyImageResult
    # The ID of the new AMI.
    property image_id : String | Nil

    def initialize(
      @image_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @image_id
        params << {"#{prefix}ImageId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='imageId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@image_id)
  end
end
