private alias Core = Amazonite::Core

module Amazonite::EC2
  # The Diffie-Hellmann group number for phase 2 IKE negotiations.
  class Phase2DHGroupNumbersListValue
    # The Diffie-Hellmann group number.
    property value : Int32 | Nil

    def initialize(
      @value : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @value
        params << {"#{prefix}Value", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        value: Core::XMLValue.i32(node.xpath_node("*[local-name()='value']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@value)
  end
end
