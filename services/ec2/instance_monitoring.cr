private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the monitoring of an instance.
  class InstanceMonitoring
    # The ID of the instance.
    property instance_id : String | Nil

    # The monitoring for the instance.
    property monitoring : Monitoring | Nil

    def initialize(
      @instance_id : String | Nil = nil,
      @monitoring : Monitoring | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @monitoring
        params.concat(value.to_query_params("#{prefix}Monitoring."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        monitoring: node.xpath_node("*[local-name()='monitoring']").try { |n| Monitoring.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @monitoring
        value.validate!
      end
    end

    def_equals_and_hash(@instance_id, @monitoring)
  end
end
