private alias Core = Amazonite::Core

module Amazonite::EC2
  # Amazon Elastic Inference is no longer available.
  #
  # Describes the memory available to the inference accelerator.
  class InferenceDeviceMemoryInfo
    # The size of the memory available to the inference accelerator, in MiB.
    property size_in_mi_b : Int32 | Nil

    def initialize(
      @size_in_mi_b : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @size_in_mi_b
        params << {"#{prefix}SizeInMiB", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        size_in_mi_b: Core::XMLValue.i32(node.xpath_node("*[local-name()='sizeInMiB']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@size_in_mi_b)
  end
end
