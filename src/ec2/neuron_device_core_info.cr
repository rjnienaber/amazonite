private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the cores available to the neuron accelerator.
  class NeuronDeviceCoreInfo
    # The number of cores available to the neuron accelerator.
    property count : Int32 | Nil

    # The version of the neuron accelerator.
    property version : Int32 | Nil

    def initialize(
      @count : Int32 | Nil = nil,
      @version : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @count
        params << {"#{prefix}Count", value.to_s}
      end

      if value = @version
        params << {"#{prefix}Version", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        count: Core::XMLValue.i32(node.xpath_node("*[local-name()='count']")),
        version: Core::XMLValue.i32(node.xpath_node("*[local-name()='version']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@count, @version)
  end
end
