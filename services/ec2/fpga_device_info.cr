private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the FPGA accelerator for the instance type.
  class FpgaDeviceInfo
    # The name of the FPGA accelerator.
    property name : String | Nil

    # The manufacturer of the FPGA accelerator.
    property manufacturer : String | Nil

    # The count of FPGA accelerators for the instance type.
    property count : Int32 | Nil

    # Describes the memory for the FPGA accelerator for the instance type.
    property memory_info : FpgaDeviceMemoryInfo | Nil

    def initialize(
      @name : String | Nil = nil,
      @manufacturer : String | Nil = nil,
      @count : Int32 | Nil = nil,
      @memory_info : FpgaDeviceMemoryInfo | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @name
        params << {"#{prefix}Name", value}
      end

      if value = @manufacturer
        params << {"#{prefix}Manufacturer", value}
      end

      if value = @count
        params << {"#{prefix}Count", value.to_s}
      end

      if value = @memory_info
        params.concat(value.to_query_params("#{prefix}MemoryInfo."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='name']")),
        manufacturer: Core::XMLValue.string(node.xpath_node("*[local-name()='manufacturer']")),
        count: Core::XMLValue.i32(node.xpath_node("*[local-name()='count']")),
        memory_info: node.xpath_node("*[local-name()='memoryInfo']").try { |n| FpgaDeviceMemoryInfo.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @memory_info
        value.validate!
      end
    end

    def_equals_and_hash(@name, @manufacturer, @count, @memory_info)
  end
end
