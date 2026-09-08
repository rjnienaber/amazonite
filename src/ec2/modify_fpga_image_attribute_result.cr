private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyFpgaImageAttributeResult
    # Information about the attribute.
    property fpga_image_attribute : FpgaImageAttribute | Nil

    def initialize(
      @fpga_image_attribute : FpgaImageAttribute | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @fpga_image_attribute
        params.concat(value.to_query_params("#{prefix}FpgaImageAttribute."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        fpga_image_attribute: node.xpath_node("*[local-name()='fpgaImageAttribute']").try { |n| FpgaImageAttribute.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @fpga_image_attribute
        value.validate!
      end
    end

    def_equals_and_hash(@fpga_image_attribute)
  end
end
