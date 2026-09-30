private alias Core = Amazonite::Core

module Amazonite::EC2
  # The minimum and maximum amount of memory, in MiB.
  class MemoryMiBRequest
    # The minimum amount of memory, in MiB. To specify no minimum limit, specify `0`.
    property min : Int32

    # The maximum amount of memory, in MiB. To specify no maximum limit, omit this parameter.
    property max : Int32 | Nil

    def initialize(
      @min : Int32,
      @max : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Min", @min.to_s}

      if value = @max
        params << {"#{prefix}Max", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        min: Core::XMLValue.i32(node.xpath_node("*[local-name()='Min']")).not_nil!,
        max: Core::XMLValue.i32(node.xpath_node("*[local-name()='Max']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@min, @max)
  end
end
