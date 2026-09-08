private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the performance characteristics of an EBS card on the instance type.
  class EbsCardInfo
    # The index of the EBS card.
    property ebs_card_index : Int32 | Nil

    # The baseline bandwidth performance for the EBS card, in Mbps.
    property baseline_bandwidth_in_mbps : Int32 | Nil

    # The baseline throughput performance for the EBS card, in MBps.
    property baseline_throughput_in_m_bps : Float64 | Nil

    # The baseline IOPS performance for the EBS card.
    property baseline_iops : Int32 | Nil

    # The maximum bandwidth performance for the EBS card, in Mbps.
    property maximum_bandwidth_in_mbps : Int32 | Nil

    # The maximum throughput performance for the EBS card, in MBps.
    property maximum_throughput_in_m_bps : Float64 | Nil

    # The maximum IOPS performance for the EBS card.
    property maximum_iops : Int32 | Nil

    def initialize(
      @ebs_card_index : Int32 | Nil = nil,
      @baseline_bandwidth_in_mbps : Int32 | Nil = nil,
      @baseline_throughput_in_m_bps : Float64 | Nil = nil,
      @baseline_iops : Int32 | Nil = nil,
      @maximum_bandwidth_in_mbps : Int32 | Nil = nil,
      @maximum_throughput_in_m_bps : Float64 | Nil = nil,
      @maximum_iops : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ebs_card_index
        params << {"#{prefix}EbsCardIndex", value.to_s}
      end

      if value = @baseline_bandwidth_in_mbps
        params << {"#{prefix}BaselineBandwidthInMbps", value.to_s}
      end

      if value = @baseline_throughput_in_m_bps
        params << {"#{prefix}BaselineThroughputInMBps", value.to_s}
      end

      if value = @baseline_iops
        params << {"#{prefix}BaselineIops", value.to_s}
      end

      if value = @maximum_bandwidth_in_mbps
        params << {"#{prefix}MaximumBandwidthInMbps", value.to_s}
      end

      if value = @maximum_throughput_in_m_bps
        params << {"#{prefix}MaximumThroughputInMBps", value.to_s}
      end

      if value = @maximum_iops
        params << {"#{prefix}MaximumIops", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ebs_card_index: Core::XMLValue.i32(node.xpath_node("*[local-name()='ebsCardIndex']")),
        baseline_bandwidth_in_mbps: Core::XMLValue.i32(node.xpath_node("*[local-name()='baselineBandwidthInMbps']")),
        baseline_throughput_in_m_bps: Core::XMLValue.f64(node.xpath_node("*[local-name()='baselineThroughputInMBps']")),
        baseline_iops: Core::XMLValue.i32(node.xpath_node("*[local-name()='baselineIops']")),
        maximum_bandwidth_in_mbps: Core::XMLValue.i32(node.xpath_node("*[local-name()='maximumBandwidthInMbps']")),
        maximum_throughput_in_m_bps: Core::XMLValue.f64(node.xpath_node("*[local-name()='maximumThroughputInMBps']")),
        maximum_iops: Core::XMLValue.i32(node.xpath_node("*[local-name()='maximumIops']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@ebs_card_index, @baseline_bandwidth_in_mbps, @baseline_throughput_in_m_bps, @baseline_iops, @maximum_bandwidth_in_mbps, @maximum_throughput_in_m_bps, @maximum_iops)
  end
end
