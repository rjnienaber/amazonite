private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # When you configure network performance options in your launch template, your instance is geared
  # for performance improvements based on the workload that it runs as soon as it's available.
  class LaunchTemplateNetworkPerformanceOptionsRequest
    # Specify the bandwidth weighting option to boost the associated type of baseline bandwidth, as
    # follows:
    #
    # default This option uses the standard bandwidth configuration for your instance type.
    #
    # vpc-1 This option boosts your networking baseline bandwidth and reduces your EBS baseline
    # bandwidth.
    #
    # ebs-1 This option boosts your EBS baseline bandwidth and reduces your networking baseline
    # bandwidth.
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
        bandwidth_weighting: (n = node.xpath_node("*[local-name()='BandwidthWeighting']")) ? AEC::InstanceBandwidthWeighting.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@bandwidth_weighting)
  end
end
