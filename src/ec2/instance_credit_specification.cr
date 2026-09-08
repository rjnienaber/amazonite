private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the credit option for CPU usage of a burstable performance instance.
  class InstanceCreditSpecification
    # The ID of the instance.
    property instance_id : String | Nil

    # The credit option for CPU usage of the instance.
    #
    # Valid values: `standard` | `unlimited`
    property cpu_credits : String | Nil

    def initialize(
      @instance_id : String | Nil = nil,
      @cpu_credits : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @cpu_credits
        params << {"#{prefix}CpuCredits", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        cpu_credits: Core::XMLValue.string(node.xpath_node("*[local-name()='cpuCredits']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_id, @cpu_credits)
  end
end
