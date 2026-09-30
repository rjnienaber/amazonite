private alias Core = Amazonite::Core

module Amazonite::EC2
  # The minimum and maximum number of accelerators (GPUs, FPGAs, or Amazon Web Services Inferentia
  # chips) on an instance. To exclude accelerator-enabled instance types, set `Max` to `0`.
  class AcceleratorCountRequest
    # The minimum number of accelerators. To specify no minimum limit, omit this parameter.
    property min : Int32 | Nil

    # The maximum number of accelerators. To specify no maximum limit, omit this parameter. To exclude
    # accelerator-enabled instance types, set `Max` to `0`.
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
        min: Core::XMLValue.i32(node.xpath_node("*[local-name()='Min']")),
        max: Core::XMLValue.i32(node.xpath_node("*[local-name()='Max']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@min, @max)
  end
end
