private alias Core = Amazonite::Core

module Amazonite::EC2
  class CopyFpgaImageResult
    # The ID of the new AFI.
    property fpga_image_id : String | Nil

    def initialize(
      @fpga_image_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @fpga_image_id
        params << {"#{prefix}FpgaImageId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        fpga_image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='fpgaImageId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@fpga_image_id)
  end
end
