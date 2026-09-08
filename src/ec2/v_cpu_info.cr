private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the vCPU configurations for the instance type.
  class VCpuInfo
    # The default number of vCPUs for the instance type.
    property default_v_cpus : Int32 | Nil

    # The default number of cores for the instance type.
    property default_cores : Int32 | Nil

    # The default number of threads per core for the instance type.
    property default_threads_per_core : Int32 | Nil

    # The valid number of cores that can be configured for the instance type.
    property valid_cores : Array(Int32) | Nil

    # The valid number of threads per core that can be configured for the instance type.
    property valid_threads_per_core : Array(Int32) | Nil

    def initialize(
      @default_v_cpus : Int32 | Nil = nil,
      @default_cores : Int32 | Nil = nil,
      @default_threads_per_core : Int32 | Nil = nil,
      @valid_cores : Array(Int32) | Nil = nil,
      @valid_threads_per_core : Array(Int32) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @default_v_cpus
        params << {"#{prefix}DefaultVCpus", value.to_s}
      end

      if value = @default_cores
        params << {"#{prefix}DefaultCores", value.to_s}
      end

      if value = @default_threads_per_core
        params << {"#{prefix}DefaultThreadsPerCore", value.to_s}
      end

      (@valid_cores || [] of Int32).each_with_index(1) do |item, i|
        params << {"#{prefix}ValidCores.#{i}", item.to_s}
      end

      (@valid_threads_per_core || [] of Int32).each_with_index(1) do |item, i|
        params << {"#{prefix}ValidThreadsPerCore.#{i}", item.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        default_v_cpus: Core::XMLValue.i32(node.xpath_node("*[local-name()='defaultVCpus']")),
        default_cores: Core::XMLValue.i32(node.xpath_node("*[local-name()='defaultCores']")),
        default_threads_per_core: Core::XMLValue.i32(node.xpath_node("*[local-name()='defaultThreadsPerCore']")),
        valid_cores: node.xpath_nodes("*[local-name()='validCores']/*[local-name()='item']").map { |n| n.content.to_i32 },
        valid_threads_per_core: node.xpath_nodes("*[local-name()='validThreadsPerCore']/*[local-name()='item']").map { |n| n.content.to_i32 },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@default_v_cpus, @default_cores, @default_threads_per_core, @valid_cores, @valid_threads_per_core)
  end
end
