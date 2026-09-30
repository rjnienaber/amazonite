private alias Core = Amazonite::Core

module Amazonite::EC2
  # The minimum and maximum amount of memory per vCPU, in GiB.
  class MemoryGiBPerVCpu
    # The minimum amount of memory per vCPU, in GiB. If this parameter is not specified, there is no
    # minimum limit.
    property min : Float64 | Nil

    # The maximum amount of memory per vCPU, in GiB. If this parameter is not specified, there is no
    # maximum limit.
    property max : Float64 | Nil

    def initialize(
      @min : Float64 | Nil = nil,
      @max : Float64 | Nil = nil,
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
        min: Core::XMLValue.f64(node.xpath_node("*[local-name()='min']")),
        max: Core::XMLValue.f64(node.xpath_node("*[local-name()='max']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@min, @max)
  end
end
