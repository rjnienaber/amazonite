private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the ICMP type and code.
  class IcmpTypeCode
    # The ICMP code. A value of -1 means all codes for the specified ICMP type.
    property code : Int32 | Nil

    # The ICMP type. A value of -1 means all types.
    property type : Int32 | Nil

    def initialize(
      @code : Int32 | Nil = nil,
      @type : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @code
        params << {"#{prefix}Code", value.to_s}
      end

      if value = @type
        params << {"#{prefix}Type", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        code: Core::XMLValue.i32(node.xpath_node("*[local-name()='code']")),
        type: Core::XMLValue.i32(node.xpath_node("*[local-name()='type']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@code, @type)
  end
end
