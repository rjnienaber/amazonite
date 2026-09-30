private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the default credit option for CPU usage of a burstable performance instance family.
  class InstanceFamilyCreditSpecification
    # The instance family.
    property instance_family : UnlimitedSupportedInstanceFamily | Nil

    # The default credit option for CPU usage of the instance family. Valid values are `standard` and
    # `unlimited`.
    property cpu_credits : String | Nil

    def initialize(
      @instance_family : UnlimitedSupportedInstanceFamily | Nil = nil,
      @cpu_credits : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_family
        params << {"#{prefix}InstanceFamily", value.to_json_object_key}
      end

      if value = @cpu_credits
        params << {"#{prefix}CpuCredits", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_family: (n = node.xpath_node("*[local-name()='instanceFamily']")) ? AEC::UnlimitedSupportedInstanceFamily.from_json_object_key?(n.content) : nil,
        cpu_credits: Core::XMLValue.string(node.xpath_node("*[local-name()='cpuCredits']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_family, @cpu_credits)
  end
end
