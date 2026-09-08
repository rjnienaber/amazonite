private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the neuron accelerators for the instance type.
  class NeuronDeviceInfo
    # The number of neuron accelerators for the instance type.
    property count : Int32 | Nil

    # The name of the neuron accelerator.
    property name : String | Nil

    # Describes the cores available to each neuron accelerator.
    property core_info : NeuronDeviceCoreInfo | Nil

    # Describes the memory available to each neuron accelerator.
    property memory_info : NeuronDeviceMemoryInfo | Nil

    def initialize(
      @count : Int32 | Nil = nil,
      @name : String | Nil = nil,
      @core_info : NeuronDeviceCoreInfo | Nil = nil,
      @memory_info : NeuronDeviceMemoryInfo | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @count
        params << {"#{prefix}Count", value.to_s}
      end

      if value = @name
        params << {"#{prefix}Name", value}
      end

      if value = @core_info
        params.concat(value.to_query_params("#{prefix}CoreInfo."))
      end

      if value = @memory_info
        params.concat(value.to_query_params("#{prefix}MemoryInfo."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        count: Core::XMLValue.i32(node.xpath_node("*[local-name()='count']")),
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='name']")),
        core_info: node.xpath_node("*[local-name()='coreInfo']").try { |n| NeuronDeviceCoreInfo.from_xml(n) },
        memory_info: node.xpath_node("*[local-name()='memoryInfo']").try { |n| NeuronDeviceMemoryInfo.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @core_info
        value.validate!
      end

      if value = @memory_info
        value.validate!
      end
    end

    def_equals_and_hash(@count, @name, @core_info, @memory_info)
  end
end
