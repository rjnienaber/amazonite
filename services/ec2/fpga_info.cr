private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the FPGAs for the instance type.
  class FpgaInfo
    # Describes the FPGAs for the instance type.
    property fpgas : Array(FpgaDeviceInfo) | Nil

    # The total memory of all FPGA accelerators for the instance type.
    property total_fpga_memory_in_mi_b : Int32 | Nil

    def initialize(
      @fpgas : Array(FpgaDeviceInfo) | Nil = nil,
      @total_fpga_memory_in_mi_b : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@fpgas || [] of FpgaDeviceInfo).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Fpgas.#{i}."))
      end

      if value = @total_fpga_memory_in_mi_b
        params << {"#{prefix}TotalFpgaMemoryInMiB", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        fpgas: node.xpath_nodes("*[local-name()='fpgas']/*[local-name()='item']").map { |n| FpgaDeviceInfo.from_xml(n) },
        total_fpga_memory_in_mi_b: Core::XMLValue.i32(node.xpath_node("*[local-name()='totalFpgaMemoryInMiB']")),
      )
    end

    def validate! : Nil
      if value = @fpgas
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@fpgas, @total_fpga_memory_in_mi_b)
  end
end
