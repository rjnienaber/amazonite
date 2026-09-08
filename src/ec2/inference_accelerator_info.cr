private alias Core = Amazonite::Core

module Amazonite::EC2
  # Amazon Elastic Inference is no longer available.
  #
  # Describes the Inference accelerators for the instance type.
  class InferenceAcceleratorInfo
    # Describes the Inference accelerators for the instance type.
    property accelerators : Array(InferenceDeviceInfo) | Nil

    # The total size of the memory for the inference accelerators for the instance type, in MiB.
    property total_inference_memory_in_mi_b : Int32 | Nil

    def initialize(
      @accelerators : Array(InferenceDeviceInfo) | Nil = nil,
      @total_inference_memory_in_mi_b : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@accelerators || [] of InferenceDeviceInfo).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Accelerators.#{i}."))
      end

      if value = @total_inference_memory_in_mi_b
        params << {"#{prefix}TotalInferenceMemoryInMiB", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        accelerators: node.xpath_nodes("*[local-name()='accelerators']/*[local-name()='item']").map { |n| InferenceDeviceInfo.from_xml(n) },
        total_inference_memory_in_mi_b: Core::XMLValue.i32(node.xpath_node("*[local-name()='totalInferenceMemoryInMiB']")),
      )
    end

    def validate! : Nil
      if value = @accelerators
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@accelerators, @total_inference_memory_in_mi_b)
  end
end
