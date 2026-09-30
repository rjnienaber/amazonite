private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the networking features of the instance type.
  class NetworkInfo
    # The network performance.
    property network_performance : String | Nil

    # The maximum number of network interfaces for the instance type.
    property maximum_network_interfaces : Int32 | Nil

    # The maximum number of physical network cards that can be allocated to the instance.
    property maximum_network_cards : Int32 | Nil

    # The index of the default network card, starting at 0.
    property default_network_card_index : Int32 | Nil

    # Describes the network cards for the instance type.
    property network_cards : Array(NetworkCardInfo) | Nil

    # The maximum number of IPv4 addresses per network interface.
    property ipv_4_addresses_per_interface : Int32 | Nil

    # The maximum number of IPv6 addresses per network interface.
    property ipv_6_addresses_per_interface : Int32 | Nil

    # Indicates whether IPv6 is supported.
    property ipv_6_supported : Bool | Nil

    # Indicates whether Elastic Network Adapter (ENA) is supported.
    property ena_support : EnaSupport | Nil

    # Indicates whether Elastic Fabric Adapter (EFA) is supported.
    property efa_supported : Bool | Nil

    # Describes the Elastic Fabric Adapters for the instance type.
    property efa_info : EfaInfo | Nil

    # Indicates whether the instance type automatically encrypts in-transit traffic between instances.
    property encryption_in_transit_supported : Bool | Nil

    # Indicates whether the instance type supports ENA Express. ENA Express uses Amazon Web Services
    # Scalable Reliable Datagram (SRD) technology to increase the maximum bandwidth used per stream
    # and minimize tail latency of network traffic between EC2 instances.
    property ena_srd_supported : Bool | Nil

    # A list of valid settings for configurable bandwidth weighting for the instance type, if
    # supported.
    property bandwidth_weightings : Array(BandwidthWeightingType) | Nil

    # Indicates whether changing the number of ENA queues is supported.
    property flexible_ena_queues_support : FlexibleEnaQueuesSupport | Nil

    # Indicates conntrack information for the instance type
    property connection_tracking_configuration : DefaultConnectionTrackingConfiguration | Nil

    # Indicates whether secondary interface attachments from secondary network are supported.
    property secondary_network_supported : Bool | Nil

    # The maximum number of secondary interfaces for the instance type.
    property maximum_secondary_network_interfaces : Int32 | Nil

    # The maximum number of IPv4 addresses per secondary interface.
    property ipv_4_addresses_per_secondary_interface : Int32 | Nil

    def initialize(
      @network_performance : String | Nil = nil,
      @maximum_network_interfaces : Int32 | Nil = nil,
      @maximum_network_cards : Int32 | Nil = nil,
      @default_network_card_index : Int32 | Nil = nil,
      @network_cards : Array(NetworkCardInfo) | Nil = nil,
      @ipv_4_addresses_per_interface : Int32 | Nil = nil,
      @ipv_6_addresses_per_interface : Int32 | Nil = nil,
      @ipv_6_supported : Bool | Nil = nil,
      @ena_support : EnaSupport | Nil = nil,
      @efa_supported : Bool | Nil = nil,
      @efa_info : EfaInfo | Nil = nil,
      @encryption_in_transit_supported : Bool | Nil = nil,
      @ena_srd_supported : Bool | Nil = nil,
      @bandwidth_weightings : Array(BandwidthWeightingType) | Nil = nil,
      @flexible_ena_queues_support : FlexibleEnaQueuesSupport | Nil = nil,
      @connection_tracking_configuration : DefaultConnectionTrackingConfiguration | Nil = nil,
      @secondary_network_supported : Bool | Nil = nil,
      @maximum_secondary_network_interfaces : Int32 | Nil = nil,
      @ipv_4_addresses_per_secondary_interface : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @network_performance
        params << {"#{prefix}NetworkPerformance", value}
      end

      if value = @maximum_network_interfaces
        params << {"#{prefix}MaximumNetworkInterfaces", value.to_s}
      end

      if value = @maximum_network_cards
        params << {"#{prefix}MaximumNetworkCards", value.to_s}
      end

      if value = @default_network_card_index
        params << {"#{prefix}DefaultNetworkCardIndex", value.to_s}
      end

      (@network_cards || [] of NetworkCardInfo).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}NetworkCards.#{i}."))
      end

      if value = @ipv_4_addresses_per_interface
        params << {"#{prefix}Ipv4AddressesPerInterface", value.to_s}
      end

      if value = @ipv_6_addresses_per_interface
        params << {"#{prefix}Ipv6AddressesPerInterface", value.to_s}
      end

      if value = @ipv_6_supported
        params << {"#{prefix}Ipv6Supported", Core::QueryValue.bool(value)}
      end

      if value = @ena_support
        params << {"#{prefix}EnaSupport", value.to_json_object_key}
      end

      if value = @efa_supported
        params << {"#{prefix}EfaSupported", Core::QueryValue.bool(value)}
      end

      if value = @efa_info
        params.concat(value.to_query_params("#{prefix}EfaInfo."))
      end

      if value = @encryption_in_transit_supported
        params << {"#{prefix}EncryptionInTransitSupported", Core::QueryValue.bool(value)}
      end

      if value = @ena_srd_supported
        params << {"#{prefix}EnaSrdSupported", Core::QueryValue.bool(value)}
      end

      (@bandwidth_weightings || [] of BandwidthWeightingType).each_with_index(1) do |item, i|
        params << {"#{prefix}BandwidthWeightings.#{i}", item.to_json_object_key}
      end

      if value = @flexible_ena_queues_support
        params << {"#{prefix}FlexibleEnaQueuesSupport", value.to_json_object_key}
      end

      if value = @connection_tracking_configuration
        params.concat(value.to_query_params("#{prefix}ConnectionTrackingConfiguration."))
      end

      if value = @secondary_network_supported
        params << {"#{prefix}SecondaryNetworkSupported", Core::QueryValue.bool(value)}
      end

      if value = @maximum_secondary_network_interfaces
        params << {"#{prefix}MaximumSecondaryNetworkInterfaces", value.to_s}
      end

      if value = @ipv_4_addresses_per_secondary_interface
        params << {"#{prefix}Ipv4AddressesPerSecondaryInterface", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_performance: Core::XMLValue.string(node.xpath_node("*[local-name()='networkPerformance']")),
        maximum_network_interfaces: Core::XMLValue.i32(node.xpath_node("*[local-name()='maximumNetworkInterfaces']")),
        maximum_network_cards: Core::XMLValue.i32(node.xpath_node("*[local-name()='maximumNetworkCards']")),
        default_network_card_index: Core::XMLValue.i32(node.xpath_node("*[local-name()='defaultNetworkCardIndex']")),
        network_cards: node.xpath_nodes("*[local-name()='networkCards']/*[local-name()='item']").map { |n| NetworkCardInfo.from_xml(n) },
        ipv_4_addresses_per_interface: Core::XMLValue.i32(node.xpath_node("*[local-name()='ipv4AddressesPerInterface']")),
        ipv_6_addresses_per_interface: Core::XMLValue.i32(node.xpath_node("*[local-name()='ipv6AddressesPerInterface']")),
        ipv_6_supported: Core::XMLValue.bool(node.xpath_node("*[local-name()='ipv6Supported']")),
        ena_support: (n = node.xpath_node("*[local-name()='enaSupport']")) ? AEC::EnaSupport.from_json_object_key?(n.content) : nil,
        efa_supported: Core::XMLValue.bool(node.xpath_node("*[local-name()='efaSupported']")),
        efa_info: node.xpath_node("*[local-name()='efaInfo']").try { |n| EfaInfo.from_xml(n) },
        encryption_in_transit_supported: Core::XMLValue.bool(node.xpath_node("*[local-name()='encryptionInTransitSupported']")),
        ena_srd_supported: Core::XMLValue.bool(node.xpath_node("*[local-name()='enaSrdSupported']")),
        bandwidth_weightings: node.xpath_nodes("*[local-name()='bandwidthWeightings']/*[local-name()='item']").compact_map { |n| AEC::BandwidthWeightingType.from_json_object_key?(n.content) },
        flexible_ena_queues_support: (n = node.xpath_node("*[local-name()='flexibleEnaQueuesSupport']")) ? AEC::FlexibleEnaQueuesSupport.from_json_object_key?(n.content) : nil,
        connection_tracking_configuration: node.xpath_node("*[local-name()='connectionTrackingConfiguration']").try { |n| DefaultConnectionTrackingConfiguration.from_xml(n) },
        secondary_network_supported: Core::XMLValue.bool(node.xpath_node("*[local-name()='secondaryNetworkSupported']")),
        maximum_secondary_network_interfaces: Core::XMLValue.i32(node.xpath_node("*[local-name()='maximumSecondaryNetworkInterfaces']")),
        ipv_4_addresses_per_secondary_interface: Core::XMLValue.i32(node.xpath_node("*[local-name()='ipv4AddressesPerSecondaryInterface']")),
      )
    end

    def validate! : Nil
      if value = @network_cards
        value.each(&.validate!)
      end

      if value = @efa_info
        value.validate!
      end

      if value = @connection_tracking_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@network_performance, @maximum_network_interfaces, @maximum_network_cards, @default_network_card_index, @network_cards, @ipv_4_addresses_per_interface, @ipv_6_addresses_per_interface, @ipv_6_supported, @ena_support, @efa_supported, @efa_info, @encryption_in_transit_supported, @ena_srd_supported, @bandwidth_weightings, @flexible_ena_queues_support, @connection_tracking_configuration, @secondary_network_supported, @maximum_secondary_network_interfaces, @ipv_4_addresses_per_secondary_interface)
  end
end
