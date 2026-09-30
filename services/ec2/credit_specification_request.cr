private alias Core = Amazonite::Core

module Amazonite::EC2
  # The credit option for CPU usage of a T instance.
  class CreditSpecificationRequest
    # The credit option for CPU usage of a T instance.
    #
    # Valid values: `standard` | `unlimited`
    property cpu_credits : String

    def initialize(
      @cpu_credits : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}CpuCredits", @cpu_credits}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cpu_credits: Core::XMLValue.string(node.xpath_node("*[local-name()='CpuCredits']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@cpu_credits)
  end
end
