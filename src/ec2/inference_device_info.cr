private alias Core = Amazonite::Core

module Amazonite::EC2
  # Amazon Elastic Inference is no longer available.
  #
  # Describes the Inference accelerators for the instance type.
  class InferenceDeviceInfo
    # The number of Inference accelerators for the instance type.
    property count : Int32 | Nil

    # The name of the Inference accelerator.
    property name : String | Nil

    # The manufacturer of the Inference accelerator.
    property manufacturer : String | Nil

    # Describes the memory available to the inference accelerator.
    property memory_info : InferenceDeviceMemoryInfo | Nil

    def initialize(
      @count : Int32 | Nil = nil,
      @name : String | Nil = nil,
      @manufacturer : String | Nil = nil,
      @memory_info : InferenceDeviceMemoryInfo | Nil = nil,
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

      if value = @manufacturer
        params << {"#{prefix}Manufacturer", value}
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
        manufacturer: Core::XMLValue.string(node.xpath_node("*[local-name()='manufacturer']")),
        memory_info: node.xpath_node("*[local-name()='memoryInfo']").try { |n| InferenceDeviceMemoryInfo.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @memory_info
        value.validate!
      end
    end

    def_equals_and_hash(@count, @name, @manufacturer, @memory_info)
  end
end
