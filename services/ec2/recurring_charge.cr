private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a recurring charge.
  class RecurringCharge
    # The amount of the recurring charge.
    property amount : Float64 | Nil

    # The frequency of the recurring charge.
    property frequency : RecurringChargeFrequency | Nil

    def initialize(
      @amount : Float64 | Nil = nil,
      @frequency : RecurringChargeFrequency | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @amount
        params << {"#{prefix}Amount", value.to_s}
      end

      if value = @frequency
        params << {"#{prefix}Frequency", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        amount: Core::XMLValue.f64(node.xpath_node("*[local-name()='amount']")),
        frequency: (n = node.xpath_node("*[local-name()='frequency']")) ? AEC::RecurringChargeFrequency.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@amount, @frequency)
  end
end
