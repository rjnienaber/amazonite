private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the credit option for CPU usage of a burstable performance instance.
  class InstanceCreditSpecificationRequest
    # The ID of the instance.
    property instance_id : String

    # The credit option for CPU usage of the instance.
    #
    # Valid values: `standard` | `unlimited`
    #
    # T3 instances with `host` tenancy do not support the `unlimited` CPU credit option.
    property cpu_credits : String | Nil

    def initialize(
      @instance_id : String,
      @cpu_credits : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}InstanceId", @instance_id}

      if value = @cpu_credits
        params << {"#{prefix}CpuCredits", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceId']")).not_nil!,
        cpu_credits: Core::XMLValue.string(node.xpath_node("*[local-name()='CpuCredits']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_id, @cpu_credits)
  end
end
