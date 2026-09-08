private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeVolumeAttributeResult
    # The state of `autoEnableIO` attribute.
    property auto_enable_io : AttributeBooleanValue | Nil

    # A list of product codes.
    property product_codes : Array(ProductCode) | Nil

    # The ID of the volume.
    property volume_id : String | Nil

    def initialize(
      @auto_enable_io : AttributeBooleanValue | Nil = nil,
      @product_codes : Array(ProductCode) | Nil = nil,
      @volume_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @auto_enable_io
        params.concat(value.to_query_params("#{prefix}AutoEnableIO."))
      end

      (@product_codes || [] of ProductCode).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ProductCodes.#{i}."))
      end

      if value = @volume_id
        params << {"#{prefix}VolumeId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        auto_enable_io: node.xpath_node("*[local-name()='autoEnableIO']").try { |n| AttributeBooleanValue.from_xml(n) },
        product_codes: node.xpath_nodes("*[local-name()='productCodes']/*[local-name()='item']").map { |n| ProductCode.from_xml(n) },
        volume_id: Core::XMLValue.string(node.xpath_node("*[local-name()='volumeId']")),
      )
    end

    def validate! : Nil
      if value = @auto_enable_io
        value.validate!
      end

      if value = @product_codes
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@auto_enable_io, @product_codes, @volume_id)
  end
end
