private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # With network performance options, you can adjust your bandwidth preferences to meet the needs of
  # the workload that runs on your instance.
  class InstanceNetworkPerformanceOptions
    # When you configure network bandwidth weighting, you can boost your baseline bandwidth for either
    # networking or EBS by up to 25%. The total available baseline bandwidth for your instance remains
    # the same. The default option uses the standard bandwidth configuration for your instance type.
    property bandwidth_weighting : InstanceBandwidthWeighting | Nil

    def initialize(
      @bandwidth_weighting : InstanceBandwidthWeighting | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @bandwidth_weighting
        params << {"#{prefix}BandwidthWeighting", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        bandwidth_weighting: (n = node.xpath_node("*[local-name()='bandwidthWeighting']")) ? AEC::InstanceBandwidthWeighting.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@bandwidth_weighting)
  end
end
