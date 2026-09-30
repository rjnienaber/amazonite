private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateFpgaImageResult
    # The FPGA image identifier (AFI ID).
    property fpga_image_id : String | Nil

    # The global FPGA image identifier (AGFI ID).
    property fpga_image_global_id : String | Nil

    def initialize(
      @fpga_image_id : String | Nil = nil,
      @fpga_image_global_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @fpga_image_id
        params << {"#{prefix}FpgaImageId", value}
      end

      if value = @fpga_image_global_id
        params << {"#{prefix}FpgaImageGlobalId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        fpga_image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='fpgaImageId']")),
        fpga_image_global_id: Core::XMLValue.string(node.xpath_node("*[local-name()='fpgaImageGlobalId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@fpga_image_id, @fpga_image_global_id)
  end
end
