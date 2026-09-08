private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an Amazon FPGA image (AFI) attribute.
  class FpgaImageAttribute
    # The ID of the AFI.
    property fpga_image_id : String | Nil

    # The name of the AFI.
    property name : String | Nil

    # The description of the AFI.
    property description : String | Nil

    # The load permissions.
    property load_permissions : Array(LoadPermission) | Nil

    # The product codes.
    property product_codes : Array(ProductCode) | Nil

    def initialize(
      @fpga_image_id : String | Nil = nil,
      @name : String | Nil = nil,
      @description : String | Nil = nil,
      @load_permissions : Array(LoadPermission) | Nil = nil,
      @product_codes : Array(ProductCode) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @fpga_image_id
        params << {"#{prefix}FpgaImageId", value}
      end

      if value = @name
        params << {"#{prefix}Name", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      (@load_permissions || [] of LoadPermission).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}LoadPermissions.#{i}."))
      end

      (@product_codes || [] of ProductCode).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ProductCodes.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        fpga_image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='fpgaImageId']")),
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='name']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        load_permissions: node.xpath_nodes("*[local-name()='loadPermissions']/*[local-name()='item']").map { |n| LoadPermission.from_xml(n) },
        product_codes: node.xpath_nodes("*[local-name()='productCodes']/*[local-name()='item']").map { |n| ProductCode.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @load_permissions
        value.each(&.validate!)
      end

      if value = @product_codes
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@fpga_image_id, @name, @description, @load_permissions, @product_codes)
  end
end
