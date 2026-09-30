private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a product code.
  class ProductCode
    # The product code.
    property product_code_id : String | Nil

    # The type of product code.
    property product_code_type : ProductCodeValues | Nil

    def initialize(
      @product_code_id : String | Nil = nil,
      @product_code_type : ProductCodeValues | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @product_code_id
        params << {"#{prefix}ProductCode", value}
      end

      if value = @product_code_type
        params << {"#{prefix}Type", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        product_code_id: Core::XMLValue.string(node.xpath_node("*[local-name()='productCode']")),
        product_code_type: (n = node.xpath_node("*[local-name()='type']")) ? AEC::ProductCodeValues.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@product_code_id, @product_code_type)
  end
end
