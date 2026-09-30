private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyInstanceNetworkPerformanceRequest
    # The ID of the instance to update.
    property instance_id : String

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
    property bandwidth_weighting : InstanceBandwidthWeighting

    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @instance_id : String,
      @bandwidth_weighting : InstanceBandwidthWeighting,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}InstanceId", @instance_id}

      params << {"#{prefix}BandwidthWeighting", @bandwidth_weighting.to_json_object_key}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceId']")).not_nil!,
        bandwidth_weighting: ((n = node.xpath_node("*[local-name()='BandwidthWeighting']")) ? AEC::InstanceBandwidthWeighting.from_json_object_key?(n.content) : nil).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_id, @bandwidth_weighting, @dry_run)
  end
end
