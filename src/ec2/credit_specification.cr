private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the credit option for CPU usage of a T instance.
  class CreditSpecification
    # The credit option for CPU usage of a T instance.
    #
    # Valid values: `standard` | `unlimited`
    property cpu_credits : String | Nil

    def initialize(
      @cpu_credits : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @cpu_credits
        params << {"#{prefix}CpuCredits", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cpu_credits: Core::XMLValue.string(node.xpath_node("*[local-name()='cpuCredits']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@cpu_credits)
  end
end
