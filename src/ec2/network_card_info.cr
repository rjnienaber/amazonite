private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the network card support of the instance type.
  class NetworkCardInfo
    # The index of the network card.
    property network_card_index : Int32 | Nil

    # The network performance of the network card.
    property network_performance : String | Nil

    # The maximum number of network interfaces for the network card.
    property maximum_network_interfaces : Int32 | Nil

    # The number of additional network interfaces that can be attached to an instance when using
    # flexible Elastic Network Adapter (ENA) queues. This number is in addition to the base number
    # specified by `maximumNetworkInterfaces`.
    property additional_flexible_network_interfaces : Int32 | Nil

    # The baseline network performance of the network card, in Gbps.
    property baseline_bandwidth_in_gbps : Float64 | Nil

    # The peak (burst) network performance of the network card, in Gbps.
    property peak_bandwidth_in_gbps : Float64 | Nil

    # The default number of the ENA queues for each interface.
    property default_ena_queue_count_per_interface : Int32 | Nil

    # The maximum number of the ENA queues.
    property maximum_ena_queue_count : Int32 | Nil

    # The maximum number of the ENA queues for each interface.
    property maximum_ena_queue_count_per_interface : Int32 | Nil

    def initialize(
      @network_card_index : Int32 | Nil = nil,
      @network_performance : String | Nil = nil,
      @maximum_network_interfaces : Int32 | Nil = nil,
      @additional_flexible_network_interfaces : Int32 | Nil = nil,
      @baseline_bandwidth_in_gbps : Float64 | Nil = nil,
      @peak_bandwidth_in_gbps : Float64 | Nil = nil,
      @default_ena_queue_count_per_interface : Int32 | Nil = nil,
      @maximum_ena_queue_count : Int32 | Nil = nil,
      @maximum_ena_queue_count_per_interface : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @network_card_index
        params << {"#{prefix}NetworkCardIndex", value.to_s}
      end

      if value = @network_performance
        params << {"#{prefix}NetworkPerformance", value}
      end

      if value = @maximum_network_interfaces
        params << {"#{prefix}MaximumNetworkInterfaces", value.to_s}
      end

      if value = @additional_flexible_network_interfaces
        params << {"#{prefix}AdditionalFlexibleNetworkInterfaces", value.to_s}
      end

      if value = @baseline_bandwidth_in_gbps
        params << {"#{prefix}BaselineBandwidthInGbps", value.to_s}
      end

      if value = @peak_bandwidth_in_gbps
        params << {"#{prefix}PeakBandwidthInGbps", value.to_s}
      end

      if value = @default_ena_queue_count_per_interface
        params << {"#{prefix}DefaultEnaQueueCountPerInterface", value.to_s}
      end

      if value = @maximum_ena_queue_count
        params << {"#{prefix}MaximumEnaQueueCount", value.to_s}
      end

      if value = @maximum_ena_queue_count_per_interface
        params << {"#{prefix}MaximumEnaQueueCountPerInterface", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_card_index: Core::XMLValue.i32(node.xpath_node("*[local-name()='networkCardIndex']")),
        network_performance: Core::XMLValue.string(node.xpath_node("*[local-name()='networkPerformance']")),
        maximum_network_interfaces: Core::XMLValue.i32(node.xpath_node("*[local-name()='maximumNetworkInterfaces']")),
        additional_flexible_network_interfaces: Core::XMLValue.i32(node.xpath_node("*[local-name()='additionalFlexibleNetworkInterfaces']")),
        baseline_bandwidth_in_gbps: Core::XMLValue.f64(node.xpath_node("*[local-name()='baselineBandwidthInGbps']")),
        peak_bandwidth_in_gbps: Core::XMLValue.f64(node.xpath_node("*[local-name()='peakBandwidthInGbps']")),
        default_ena_queue_count_per_interface: Core::XMLValue.i32(node.xpath_node("*[local-name()='defaultEnaQueueCountPerInterface']")),
        maximum_ena_queue_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='maximumEnaQueueCount']")),
        maximum_ena_queue_count_per_interface: Core::XMLValue.i32(node.xpath_node("*[local-name()='maximumEnaQueueCountPerInterface']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@network_card_index, @network_performance, @maximum_network_interfaces, @additional_flexible_network_interfaces, @baseline_bandwidth_in_gbps, @peak_bandwidth_in_gbps, @default_ena_queue_count_per_interface, @maximum_ena_queue_count, @maximum_ena_queue_count_per_interface)
  end
end
