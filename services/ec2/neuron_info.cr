private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the neuron accelerators for the instance type.
  class NeuronInfo
    # Describes the neuron accelerators for the instance type.
    property neuron_devices : Array(NeuronDeviceInfo) | Nil

    # The total size of the memory for the neuron accelerators for the instance type, in MiB.
    property total_neuron_device_memory_in_mi_b : Int32 | Nil

    def initialize(
      @neuron_devices : Array(NeuronDeviceInfo) | Nil = nil,
      @total_neuron_device_memory_in_mi_b : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@neuron_devices || [] of NeuronDeviceInfo).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}NeuronDevices.#{i}."))
      end

      if value = @total_neuron_device_memory_in_mi_b
        params << {"#{prefix}TotalNeuronDeviceMemoryInMiB", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        neuron_devices: node.xpath_nodes("*[local-name()='neuronDevices']/*[local-name()='item']").map { |n| NeuronDeviceInfo.from_xml(n) },
        total_neuron_device_memory_in_mi_b: Core::XMLValue.i32(node.xpath_node("*[local-name()='totalNeuronDeviceMemoryInMiB']")),
      )
    end

    def validate! : Nil
      if value = @neuron_devices
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@neuron_devices, @total_neuron_device_memory_in_mi_b)
  end
end
