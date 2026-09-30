private alias Core = Amazonite::Core

module Amazonite::EC2
  # The VPN tunnel options.
  class TunnelOption
    # The external IP address of the VPN tunnel.
    property outside_ip_address : String | Nil

    # The range of inside IPv4 addresses for the tunnel.
    property tunnel_inside_cidr : String | Nil

    # The range of inside IPv6 addresses for the tunnel.
    property tunnel_inside_ipv_6_cidr : String | Nil

    # The pre-shared key (PSK) to establish initial authentication between the virtual private gateway
    # and the customer gateway.
    property pre_shared_key : String | Nil

    # The lifetime for phase 1 of the IKE negotiation, in seconds.
    property phase_1_lifetime_seconds : Int32 | Nil

    # The lifetime for phase 2 of the IKE negotiation, in seconds.
    property phase_2_lifetime_seconds : Int32 | Nil

    # The margin time, in seconds, before the phase 2 lifetime expires, during which the Amazon Web
    # Services side of the VPN connection performs an IKE rekey.
    property rekey_margin_time_seconds : Int32 | Nil

    # The percentage of the rekey window determined by `RekeyMarginTimeSeconds` during which the rekey
    # time is randomly selected.
    property rekey_fuzz_percentage : Int32 | Nil

    # The number of packets in an IKE replay window.
    property replay_window_size : Int32 | Nil

    # The number of seconds after which a DPD timeout occurs.
    property dpd_timeout_seconds : Int32 | Nil

    # The action to take after a DPD timeout occurs.
    property dpd_timeout_action : String | Nil

    # The permitted encryption algorithms for the VPN tunnel for phase 1 IKE negotiations.
    property phase_1_encryption_algorithms : Array(Phase1EncryptionAlgorithmsListValue) | Nil

    # The permitted encryption algorithms for the VPN tunnel for phase 2 IKE negotiations.
    property phase_2_encryption_algorithms : Array(Phase2EncryptionAlgorithmsListValue) | Nil

    # The permitted integrity algorithms for the VPN tunnel for phase 1 IKE negotiations.
    property phase_1_integrity_algorithms : Array(Phase1IntegrityAlgorithmsListValue) | Nil

    # The permitted integrity algorithms for the VPN tunnel for phase 2 IKE negotiations.
    property phase_2_integrity_algorithms : Array(Phase2IntegrityAlgorithmsListValue) | Nil

    # The permitted Diffie-Hellman group numbers for the VPN tunnel for phase 1 IKE negotiations.
    property phase_1dh_group_numbers : Array(Phase1DHGroupNumbersListValue) | Nil

    # The permitted Diffie-Hellman group numbers for the VPN tunnel for phase 2 IKE negotiations.
    property phase_2dh_group_numbers : Array(Phase2DHGroupNumbersListValue) | Nil

    # The IKE versions that are permitted for the VPN tunnel.
    property ike_versions : Array(IKEVersionsListValue) | Nil

    # The action to take when the establishing the VPN tunnels for a VPN connection.
    property startup_action : String | Nil

    # Options for logging VPN tunnel activity.
    property log_options : VpnTunnelLogOptions | Nil

    # Status of tunnel endpoint lifecycle control feature.
    property enable_tunnel_lifecycle_control : Bool | Nil

    def initialize(
      @outside_ip_address : String | Nil = nil,
      @tunnel_inside_cidr : String | Nil = nil,
      @tunnel_inside_ipv_6_cidr : String | Nil = nil,
      @pre_shared_key : String | Nil = nil,
      @phase_1_lifetime_seconds : Int32 | Nil = nil,
      @phase_2_lifetime_seconds : Int32 | Nil = nil,
      @rekey_margin_time_seconds : Int32 | Nil = nil,
      @rekey_fuzz_percentage : Int32 | Nil = nil,
      @replay_window_size : Int32 | Nil = nil,
      @dpd_timeout_seconds : Int32 | Nil = nil,
      @dpd_timeout_action : String | Nil = nil,
      @phase_1_encryption_algorithms : Array(Phase1EncryptionAlgorithmsListValue) | Nil = nil,
      @phase_2_encryption_algorithms : Array(Phase2EncryptionAlgorithmsListValue) | Nil = nil,
      @phase_1_integrity_algorithms : Array(Phase1IntegrityAlgorithmsListValue) | Nil = nil,
      @phase_2_integrity_algorithms : Array(Phase2IntegrityAlgorithmsListValue) | Nil = nil,
      @phase_1dh_group_numbers : Array(Phase1DHGroupNumbersListValue) | Nil = nil,
      @phase_2dh_group_numbers : Array(Phase2DHGroupNumbersListValue) | Nil = nil,
      @ike_versions : Array(IKEVersionsListValue) | Nil = nil,
      @startup_action : String | Nil = nil,
      @log_options : VpnTunnelLogOptions | Nil = nil,
      @enable_tunnel_lifecycle_control : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @outside_ip_address
        params << {"#{prefix}OutsideIpAddress", value}
      end

      if value = @tunnel_inside_cidr
        params << {"#{prefix}TunnelInsideCidr", value}
      end

      if value = @tunnel_inside_ipv_6_cidr
        params << {"#{prefix}TunnelInsideIpv6Cidr", value}
      end

      if value = @pre_shared_key
        params << {"#{prefix}PreSharedKey", value}
      end

      if value = @phase_1_lifetime_seconds
        params << {"#{prefix}Phase1LifetimeSeconds", value.to_s}
      end

      if value = @phase_2_lifetime_seconds
        params << {"#{prefix}Phase2LifetimeSeconds", value.to_s}
      end

      if value = @rekey_margin_time_seconds
        params << {"#{prefix}RekeyMarginTimeSeconds", value.to_s}
      end

      if value = @rekey_fuzz_percentage
        params << {"#{prefix}RekeyFuzzPercentage", value.to_s}
      end

      if value = @replay_window_size
        params << {"#{prefix}ReplayWindowSize", value.to_s}
      end

      if value = @dpd_timeout_seconds
        params << {"#{prefix}DpdTimeoutSeconds", value.to_s}
      end

      if value = @dpd_timeout_action
        params << {"#{prefix}DpdTimeoutAction", value}
      end

      (@phase_1_encryption_algorithms || [] of Phase1EncryptionAlgorithmsListValue).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Phase1EncryptionAlgorithmSet.#{i}."))
      end

      (@phase_2_encryption_algorithms || [] of Phase2EncryptionAlgorithmsListValue).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Phase2EncryptionAlgorithmSet.#{i}."))
      end

      (@phase_1_integrity_algorithms || [] of Phase1IntegrityAlgorithmsListValue).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Phase1IntegrityAlgorithmSet.#{i}."))
      end

      (@phase_2_integrity_algorithms || [] of Phase2IntegrityAlgorithmsListValue).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Phase2IntegrityAlgorithmSet.#{i}."))
      end

      (@phase_1dh_group_numbers || [] of Phase1DHGroupNumbersListValue).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Phase1DHGroupNumberSet.#{i}."))
      end

      (@phase_2dh_group_numbers || [] of Phase2DHGroupNumbersListValue).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Phase2DHGroupNumberSet.#{i}."))
      end

      (@ike_versions || [] of IKEVersionsListValue).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}IkeVersionSet.#{i}."))
      end

      if value = @startup_action
        params << {"#{prefix}StartupAction", value}
      end

      if value = @log_options
        params.concat(value.to_query_params("#{prefix}LogOptions."))
      end

      if value = @enable_tunnel_lifecycle_control
        params << {"#{prefix}EnableTunnelLifecycleControl", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        outside_ip_address: Core::XMLValue.string(node.xpath_node("*[local-name()='outsideIpAddress']")),
        tunnel_inside_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='tunnelInsideCidr']")),
        tunnel_inside_ipv_6_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='tunnelInsideIpv6Cidr']")),
        pre_shared_key: Core::XMLValue.string(node.xpath_node("*[local-name()='preSharedKey']")),
        phase_1_lifetime_seconds: Core::XMLValue.i32(node.xpath_node("*[local-name()='phase1LifetimeSeconds']")),
        phase_2_lifetime_seconds: Core::XMLValue.i32(node.xpath_node("*[local-name()='phase2LifetimeSeconds']")),
        rekey_margin_time_seconds: Core::XMLValue.i32(node.xpath_node("*[local-name()='rekeyMarginTimeSeconds']")),
        rekey_fuzz_percentage: Core::XMLValue.i32(node.xpath_node("*[local-name()='rekeyFuzzPercentage']")),
        replay_window_size: Core::XMLValue.i32(node.xpath_node("*[local-name()='replayWindowSize']")),
        dpd_timeout_seconds: Core::XMLValue.i32(node.xpath_node("*[local-name()='dpdTimeoutSeconds']")),
        dpd_timeout_action: Core::XMLValue.string(node.xpath_node("*[local-name()='dpdTimeoutAction']")),
        phase_1_encryption_algorithms: node.xpath_nodes("*[local-name()='phase1EncryptionAlgorithmSet']/*[local-name()='item']").map { |n| Phase1EncryptionAlgorithmsListValue.from_xml(n) },
        phase_2_encryption_algorithms: node.xpath_nodes("*[local-name()='phase2EncryptionAlgorithmSet']/*[local-name()='item']").map { |n| Phase2EncryptionAlgorithmsListValue.from_xml(n) },
        phase_1_integrity_algorithms: node.xpath_nodes("*[local-name()='phase1IntegrityAlgorithmSet']/*[local-name()='item']").map { |n| Phase1IntegrityAlgorithmsListValue.from_xml(n) },
        phase_2_integrity_algorithms: node.xpath_nodes("*[local-name()='phase2IntegrityAlgorithmSet']/*[local-name()='item']").map { |n| Phase2IntegrityAlgorithmsListValue.from_xml(n) },
        phase_1dh_group_numbers: node.xpath_nodes("*[local-name()='phase1DHGroupNumberSet']/*[local-name()='item']").map { |n| Phase1DHGroupNumbersListValue.from_xml(n) },
        phase_2dh_group_numbers: node.xpath_nodes("*[local-name()='phase2DHGroupNumberSet']/*[local-name()='item']").map { |n| Phase2DHGroupNumbersListValue.from_xml(n) },
        ike_versions: node.xpath_nodes("*[local-name()='ikeVersionSet']/*[local-name()='item']").map { |n| IKEVersionsListValue.from_xml(n) },
        startup_action: Core::XMLValue.string(node.xpath_node("*[local-name()='startupAction']")),
        log_options: node.xpath_node("*[local-name()='logOptions']").try { |n| VpnTunnelLogOptions.from_xml(n) },
        enable_tunnel_lifecycle_control: Core::XMLValue.bool(node.xpath_node("*[local-name()='enableTunnelLifecycleControl']")),
      )
    end

    def validate! : Nil
      if value = @phase_1_encryption_algorithms
        value.each(&.validate!)
      end

      if value = @phase_2_encryption_algorithms
        value.each(&.validate!)
      end

      if value = @phase_1_integrity_algorithms
        value.each(&.validate!)
      end

      if value = @phase_2_integrity_algorithms
        value.each(&.validate!)
      end

      if value = @phase_1dh_group_numbers
        value.each(&.validate!)
      end

      if value = @phase_2dh_group_numbers
        value.each(&.validate!)
      end

      if value = @ike_versions
        value.each(&.validate!)
      end

      if value = @log_options
        value.validate!
      end
    end

    def_equals_and_hash(@outside_ip_address, @tunnel_inside_cidr, @tunnel_inside_ipv_6_cidr, @pre_shared_key, @phase_1_lifetime_seconds, @phase_2_lifetime_seconds, @rekey_margin_time_seconds, @rekey_fuzz_percentage, @replay_window_size, @dpd_timeout_seconds, @dpd_timeout_action, @phase_1_encryption_algorithms, @phase_2_encryption_algorithms, @phase_1_integrity_algorithms, @phase_2_integrity_algorithms, @phase_1dh_group_numbers, @phase_2dh_group_numbers, @ike_versions, @startup_action, @log_options, @enable_tunnel_lifecycle_control)
  end
end
