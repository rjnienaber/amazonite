private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyInstanceNetworkPerformanceResult
    # The instance ID that was updated.
    property instance_id : String | Nil

    # Contains the updated configuration for bandwidth weighting on the specified instance.
    property bandwidth_weighting : InstanceBandwidthWeighting | Nil

    def initialize(
      @instance_id : String | Nil = nil,
      @bandwidth_weighting : InstanceBandwidthWeighting | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @bandwidth_weighting
        params << {"#{prefix}BandwidthWeighting", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        bandwidth_weighting: (n = node.xpath_node("*[local-name()='bandwidthWeighting']")) ? AEC::InstanceBandwidthWeighting.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_id, @bandwidth_weighting)
  end
end
