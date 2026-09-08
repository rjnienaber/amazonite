private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a running instance in a Spot Fleet.
  class ActiveInstance
    # The ID of the instance.
    property instance_id : String | Nil

    # The instance type.
    property instance_type : String | Nil

    # The ID of the Spot Instance request.
    property spot_instance_request_id : String | Nil

    # The health status of the instance. If the status of either the instance status check or the
    # system status check is `impaired`, the health status of the instance is `unhealthy`. Otherwise,
    # the health status is `healthy`.
    property instance_health : InstanceHealthStatus | Nil

    def initialize(
      @instance_id : String | Nil = nil,
      @instance_type : String | Nil = nil,
      @spot_instance_request_id : String | Nil = nil,
      @instance_health : InstanceHealthStatus | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @instance_type
        params << {"#{prefix}InstanceType", value}
      end

      if value = @spot_instance_request_id
        params << {"#{prefix}SpotInstanceRequestId", value}
      end

      if value = @instance_health
        params << {"#{prefix}InstanceHealth", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        instance_type: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceType']")),
        spot_instance_request_id: Core::XMLValue.string(node.xpath_node("*[local-name()='spotInstanceRequestId']")),
        instance_health: (n = node.xpath_node("*[local-name()='instanceHealth']")) ? AEC::InstanceHealthStatus.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_id, @instance_type, @spot_instance_request_id, @instance_health)
  end
end
