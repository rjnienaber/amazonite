private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the GPU accelerators for the instance type.
  class GpuDeviceInfo
    # The name of the GPU accelerator.
    property name : String | Nil

    # The manufacturer of the GPU accelerator.
    property manufacturer : String | Nil

    # The number of GPUs for the instance type.
    property count : Int32 | Nil

    # Total number of GPU devices of this type.
    property logical_gpu_count : Int32 | Nil

    # The size of each GPU as a fraction of a full GPU, between 0 (excluded) and 1 (included).
    property gpu_partition_size : Float64 | Nil

    # A list of workload types this GPU supports.
    property workloads : Array(String) | Nil

    # Describes the memory available to the GPU accelerator.
    property memory_info : GpuDeviceMemoryInfo | Nil

    def initialize(
      @name : String | Nil = nil,
      @manufacturer : String | Nil = nil,
      @count : Int32 | Nil = nil,
      @logical_gpu_count : Int32 | Nil = nil,
      @gpu_partition_size : Float64 | Nil = nil,
      @workloads : Array(String) | Nil = nil,
      @memory_info : GpuDeviceMemoryInfo | Nil = nil,
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

      if value = @logical_gpu_count
        params << {"#{prefix}LogicalGpuCount", value.to_s}
      end

      if value = @gpu_partition_size
        params << {"#{prefix}GpuPartitionSize", value.to_s}
      end

      (@workloads || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}WorkloadSet.#{i}", item}
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
        logical_gpu_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='logicalGpuCount']")),
        gpu_partition_size: Core::XMLValue.f64(node.xpath_node("*[local-name()='gpuPartitionSize']")),
        workloads: node.xpath_nodes("*[local-name()='workloadSet']/*[local-name()='item']").map { |n| n.content },
        memory_info: node.xpath_node("*[local-name()='memoryInfo']").try { |n| GpuDeviceMemoryInfo.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @memory_info
        value.validate!
      end
    end

    def_equals_and_hash(@name, @manufacturer, @count, @logical_gpu_count, @gpu_partition_size, @workloads, @memory_info)
  end
end
