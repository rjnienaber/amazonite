private alias Core = Amazonite::Core

module Amazonite::EC2
  # The minimum and maximum number of accelerators (GPUs, FPGAs, or Amazon Web Services Inferentia
  # chips) on an instance.
  class AcceleratorCount
    # The minimum number of accelerators. If this parameter is not specified, there is no minimum
    # limit.
    property min : Int32 | Nil

    # The maximum number of accelerators. If this parameter is not specified, there is no maximum
    # limit.
    property max : Int32 | Nil

    def initialize(
      @min : Int32 | Nil = nil,
      @max : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @min
        params << {"#{prefix}Min", value.to_s}
      end

      if value = @max
        params << {"#{prefix}Max", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        min: Core::XMLValue.i32(node.xpath_node("*[local-name()='min']")),
        max: Core::XMLValue.i32(node.xpath_node("*[local-name()='max']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@min, @max)
  end
end
