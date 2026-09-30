private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the GPU accelerators for the instance type.
  class GpuInfo
    # Describes the GPU accelerators for the instance type.
    property gpus : Array(GpuDeviceInfo) | Nil

    # The total size of the memory for the GPU accelerators for the instance type, in MiB.
    property total_gpu_memory_in_mi_b : Int32 | Nil

    def initialize(
      @gpus : Array(GpuDeviceInfo) | Nil = nil,
      @total_gpu_memory_in_mi_b : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@gpus || [] of GpuDeviceInfo).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Gpus.#{i}."))
      end

      if value = @total_gpu_memory_in_mi_b
        params << {"#{prefix}TotalGpuMemoryInMiB", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        gpus: node.xpath_nodes("*[local-name()='gpus']/*[local-name()='item']").map { |n| GpuDeviceInfo.from_xml(n) },
        total_gpu_memory_in_mi_b: Core::XMLValue.i32(node.xpath_node("*[local-name()='totalGpuMemoryInMiB']")),
      )
    end

    def validate! : Nil
      if value = @gpus
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@gpus, @total_gpu_memory_in_mi_b)
  end
end
