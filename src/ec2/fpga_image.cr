private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an Amazon FPGA image (AFI).
  class FpgaImage
    # The FPGA image identifier (AFI ID).
    property fpga_image_id : String | Nil

    # The global FPGA image identifier (AGFI ID).
    property fpga_image_global_id : String | Nil

    # The name of the AFI.
    property name : String | Nil

    # The description of the AFI.
    property description : String | Nil

    # The version of the Amazon Web Services Shell that was used to create the bitstream.
    property shell_version : String | Nil

    # Information about the PCI bus.
    property pci_id : PciId | Nil

    # Information about the state of the AFI.
    property state : FpgaImageState | Nil

    # The date and time the AFI was created.
    property create_time : Time | Nil

    # The time of the most recent update to the AFI.
    property update_time : Time | Nil

    # The ID of the Amazon Web Services account that owns the AFI.
    property owner_id : String | Nil

    # The alias of the AFI owner. Possible values include `self`, `amazon`, and `aws-marketplace`.
    property owner_alias : String | Nil

    # The product codes for the AFI.
    property product_codes : Array(ProductCode) | Nil

    # Any tags assigned to the AFI.
    property tags : Array(Tag) | Nil

    # Indicates whether the AFI is public.
    property public : Bool | Nil

    # Indicates whether data retention support is enabled for the AFI.
    property data_retention_support : Bool | Nil

    # The instance types supported by the AFI.
    property instance_types : Array(String) | Nil

    def initialize(
      @fpga_image_id : String | Nil = nil,
      @fpga_image_global_id : String | Nil = nil,
      @name : String | Nil = nil,
      @description : String | Nil = nil,
      @shell_version : String | Nil = nil,
      @pci_id : PciId | Nil = nil,
      @state : FpgaImageState | Nil = nil,
      @create_time : Time | Nil = nil,
      @update_time : Time | Nil = nil,
      @owner_id : String | Nil = nil,
      @owner_alias : String | Nil = nil,
      @product_codes : Array(ProductCode) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @public : Bool | Nil = nil,
      @data_retention_support : Bool | Nil = nil,
      @instance_types : Array(String) | Nil = nil,
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

      if value = @name
        params << {"#{prefix}Name", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @shell_version
        params << {"#{prefix}ShellVersion", value}
      end

      if value = @pci_id
        params.concat(value.to_query_params("#{prefix}PciId."))
      end

      if value = @state
        params.concat(value.to_query_params("#{prefix}State."))
      end

      if value = @create_time
        params << {"#{prefix}CreateTime", Core::QueryValue.time(value)}
      end

      if value = @update_time
        params << {"#{prefix}UpdateTime", Core::QueryValue.time(value)}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @owner_alias
        params << {"#{prefix}OwnerAlias", value}
      end

      (@product_codes || [] of ProductCode).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ProductCodes.#{i}."))
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.#{i}."))
      end

      if value = @public
        params << {"#{prefix}Public", Core::QueryValue.bool(value)}
      end

      if value = @data_retention_support
        params << {"#{prefix}DataRetentionSupport", Core::QueryValue.bool(value)}
      end

      (@instance_types || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}InstanceTypes.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        fpga_image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='fpgaImageId']")),
        fpga_image_global_id: Core::XMLValue.string(node.xpath_node("*[local-name()='fpgaImageGlobalId']")),
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='name']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        shell_version: Core::XMLValue.string(node.xpath_node("*[local-name()='shellVersion']")),
        pci_id: node.xpath_node("*[local-name()='pciId']").try { |n| PciId.from_xml(n) },
        state: node.xpath_node("*[local-name()='state']").try { |n| FpgaImageState.from_xml(n) },
        create_time: Core::XMLValue.time(node.xpath_node("*[local-name()='createTime']")),
        update_time: Core::XMLValue.time(node.xpath_node("*[local-name()='updateTime']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        owner_alias: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerAlias']")),
        product_codes: node.xpath_nodes("*[local-name()='productCodes']/*[local-name()='item']").map { |n| ProductCode.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='tags']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        public: Core::XMLValue.bool(node.xpath_node("*[local-name()='public']")),
        data_retention_support: Core::XMLValue.bool(node.xpath_node("*[local-name()='dataRetentionSupport']")),
        instance_types: node.xpath_nodes("*[local-name()='instanceTypes']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
      if value = @pci_id
        value.validate!
      end

      if value = @state
        value.validate!
      end

      if value = @product_codes
        value.each(&.validate!)
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@fpga_image_id, @fpga_image_global_id, @name, @description, @shell_version, @pci_id, @state, @create_time, @update_time, @owner_id, @owner_alias, @product_codes, @tags, @public, @data_retention_support, @instance_types)
  end
end
