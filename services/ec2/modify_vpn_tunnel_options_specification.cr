private alias Core = Amazonite::Core

module Amazonite::EC2
  # The Amazon Web Services Site-to-Site VPN tunnel options to modify.
  class ModifyVpnTunnelOptionsSpecification
    # The range of inside IPv4 addresses for the tunnel. Any specified CIDR blocks must be unique
    # across all VPN connections that use the same virtual private gateway.
    #
    # Constraints: A size /30 CIDR block from the `169.254.0.0/16` range. The following CIDR blocks
    # are reserved and cannot be used:
    #
    # - `169.254.0.0/30`
    #
    # - `169.254.1.0/30`
    #
    # - `169.254.2.0/30`
    #
    # - `169.254.3.0/30`
    #
    # - `169.254.4.0/30`
    #
    # - `169.254.5.0/30`
    #
    # - `169.254.169.252/30`
    property tunnel_inside_cidr : String | Nil

    # The range of inside IPv6 addresses for the tunnel. Any specified CIDR blocks must be unique
    # across all VPN connections that use the same transit gateway.
    #
    # Constraints: A size /126 CIDR block from the local `fd00::/8` range.
    property tunnel_inside_ipv_6_cidr : String | Nil

    # The pre-shared key (PSK) to establish initial authentication between the virtual private gateway
    # and the customer gateway.
    #
    # Constraints: Allowed characters are alphanumeric characters, periods (.), and underscores (_).
    # Must be between 8 and 64 characters in length and cannot start with zero (0).
    property pre_shared_key : String | Nil

    # The lifetime for phase 1 of the IKE negotiation, in seconds.
    #
    # Constraints: A value between 900 and 28,800.
    #
    # Default: `28800`
    property phase_1_lifetime_seconds : Int32 | Nil

    # The lifetime for phase 2 of the IKE negotiation, in seconds.
    #
    # Constraints: A value between 900 and 3,600. The value must be less than the value for
    # `Phase1LifetimeSeconds`.
    #
    # Default: `3600`
    property phase_2_lifetime_seconds : Int32 | Nil

    # The margin time, in seconds, before the phase 2 lifetime expires, during which the Amazon Web
    # Services side of the VPN connection performs an IKE rekey. The exact time of the rekey is
    # randomly selected based on the value for `RekeyFuzzPercentage`.
    #
    # Constraints: A value between 60 and half of `Phase2LifetimeSeconds`.
    #
    # Default: `270`
    property rekey_margin_time_seconds : Int32 | Nil

    # The percentage of the rekey window (determined by `RekeyMarginTimeSeconds`) during which the
    # rekey time is randomly selected.
    #
    # Constraints: A value between 0 and 100.
    #
    # Default: `100`
    property rekey_fuzz_percentage : Int32 | Nil

    # The number of packets in an IKE replay window.
    #
    # Constraints: A value between 64 and 2048.
    #
    # Default: `1024`
    property replay_window_size : Int32 | Nil

    # The number of seconds after which a DPD timeout occurs. A DPD timeout of 40 seconds means that
    # the VPN endpoint will consider the peer dead 30 seconds after the first failed keep-alive.
    #
    # Constraints: A value greater than or equal to 30.
    #
    # Default: `40`
    property dpd_timeout_seconds : Int32 | Nil

    # The action to take after DPD timeout occurs. Specify `restart` to restart the IKE initiation.
    # Specify `clear` to end the IKE session.
    #
    # Valid Values: `clear` | `none` | `restart`
    #
    # Default: `clear`
    property dpd_timeout_action : String | Nil

    # One or more encryption algorithms that are permitted for the VPN tunnel for phase 1 IKE
    # negotiations.
    #
    # Valid values: `AES128` | `AES256` | `AES128-GCM-16` | `AES256-GCM-16`
    property phase_1_encryption_algorithms : Array(Phase1EncryptionAlgorithmsRequestListValue) | Nil

    # One or more encryption algorithms that are permitted for the VPN tunnel for phase 2 IKE
    # negotiations.
    #
    # Valid values: `AES128` | `AES256` | `AES128-GCM-16` | `AES256-GCM-16`
    property phase_2_encryption_algorithms : Array(Phase2EncryptionAlgorithmsRequestListValue) | Nil

    # One or more integrity algorithms that are permitted for the VPN tunnel for phase 1 IKE
    # negotiations.
    #
    # Valid values: `SHA1` | `SHA2-256` | `SHA2-384` | `SHA2-512`
    property phase_1_integrity_algorithms : Array(Phase1IntegrityAlgorithmsRequestListValue) | Nil

    # One or more integrity algorithms that are permitted for the VPN tunnel for phase 2 IKE
    # negotiations.
    #
    # Valid values: `SHA1` | `SHA2-256` | `SHA2-384` | `SHA2-512`
    property phase_2_integrity_algorithms : Array(Phase2IntegrityAlgorithmsRequestListValue) | Nil

    # One or more Diffie-Hellman group numbers that are permitted for the VPN tunnel for phase 1 IKE
    # negotiations.
    #
    # Valid values: `2` | `14` | `15` | `16` | `17` | `18` | `19` | `20` | `21` | `22` | `23` | `24`
    property phase_1dh_group_numbers : Array(Phase1DHGroupNumbersRequestListValue) | Nil

    # One or more Diffie-Hellman group numbers that are permitted for the VPN tunnel for phase 2 IKE
    # negotiations.
    #
    # Valid values: `2` | `5` | `14` | `15` | `16` | `17` | `18` | `19` | `20` | `21` | `22` | `23` |
    # `24`
    property phase_2dh_group_numbers : Array(Phase2DHGroupNumbersRequestListValue) | Nil

    # The IKE versions that are permitted for the VPN tunnel.
    #
    # Valid values: `ikev1` | `ikev2`
    property ike_versions : Array(IKEVersionsRequestListValue) | Nil

    # The action to take when the establishing the tunnel for the VPN connection. By default, your
    # customer gateway device must initiate the IKE negotiation and bring up the tunnel. Specify
    # `start` for Amazon Web Services to initiate the IKE negotiation.
    #
    # Valid Values: `add` | `start`
    #
    # Default: `add`
    property startup_action : String | Nil

    # Options for logging VPN tunnel activity.
    property log_options : VpnTunnelLogOptionsSpecification | Nil

    # Turn on or off tunnel endpoint lifecycle control feature.
    property enable_tunnel_lifecycle_control : Bool | Nil

    def initialize(
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
      @phase_1_encryption_algorithms : Array(Phase1EncryptionAlgorithmsRequestListValue) | Nil = nil,
      @phase_2_encryption_algorithms : Array(Phase2EncryptionAlgorithmsRequestListValue) | Nil = nil,
      @phase_1_integrity_algorithms : Array(Phase1IntegrityAlgorithmsRequestListValue) | Nil = nil,
      @phase_2_integrity_algorithms : Array(Phase2IntegrityAlgorithmsRequestListValue) | Nil = nil,
      @phase_1dh_group_numbers : Array(Phase1DHGroupNumbersRequestListValue) | Nil = nil,
      @phase_2dh_group_numbers : Array(Phase2DHGroupNumbersRequestListValue) | Nil = nil,
      @ike_versions : Array(IKEVersionsRequestListValue) | Nil = nil,
      @startup_action : String | Nil = nil,
      @log_options : VpnTunnelLogOptionsSpecification | Nil = nil,
      @enable_tunnel_lifecycle_control : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

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
        params << {"#{prefix}DPDTimeoutSeconds", value.to_s}
      end

      if value = @dpd_timeout_action
        params << {"#{prefix}DPDTimeoutAction", value}
      end

      (@phase_1_encryption_algorithms || [] of Phase1EncryptionAlgorithmsRequestListValue).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Phase1EncryptionAlgorithm.#{i}."))
      end

      (@phase_2_encryption_algorithms || [] of Phase2EncryptionAlgorithmsRequestListValue).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Phase2EncryptionAlgorithm.#{i}."))
      end

      (@phase_1_integrity_algorithms || [] of Phase1IntegrityAlgorithmsRequestListValue).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Phase1IntegrityAlgorithm.#{i}."))
      end

      (@phase_2_integrity_algorithms || [] of Phase2IntegrityAlgorithmsRequestListValue).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Phase2IntegrityAlgorithm.#{i}."))
      end

      (@phase_1dh_group_numbers || [] of Phase1DHGroupNumbersRequestListValue).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Phase1DHGroupNumber.#{i}."))
      end

      (@phase_2dh_group_numbers || [] of Phase2DHGroupNumbersRequestListValue).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Phase2DHGroupNumber.#{i}."))
      end

      (@ike_versions || [] of IKEVersionsRequestListValue).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}IKEVersion.#{i}."))
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
        tunnel_inside_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='TunnelInsideCidr']")),
        tunnel_inside_ipv_6_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='TunnelInsideIpv6Cidr']")),
        pre_shared_key: Core::XMLValue.string(node.xpath_node("*[local-name()='PreSharedKey']")),
        phase_1_lifetime_seconds: Core::XMLValue.i32(node.xpath_node("*[local-name()='Phase1LifetimeSeconds']")),
        phase_2_lifetime_seconds: Core::XMLValue.i32(node.xpath_node("*[local-name()='Phase2LifetimeSeconds']")),
        rekey_margin_time_seconds: Core::XMLValue.i32(node.xpath_node("*[local-name()='RekeyMarginTimeSeconds']")),
        rekey_fuzz_percentage: Core::XMLValue.i32(node.xpath_node("*[local-name()='RekeyFuzzPercentage']")),
        replay_window_size: Core::XMLValue.i32(node.xpath_node("*[local-name()='ReplayWindowSize']")),
        dpd_timeout_seconds: Core::XMLValue.i32(node.xpath_node("*[local-name()='DPDTimeoutSeconds']")),
        dpd_timeout_action: Core::XMLValue.string(node.xpath_node("*[local-name()='DPDTimeoutAction']")),
        phase_1_encryption_algorithms: node.xpath_nodes("*[local-name()='Phase1EncryptionAlgorithm']/*[local-name()='item']").map { |n| Phase1EncryptionAlgorithmsRequestListValue.from_xml(n) },
        phase_2_encryption_algorithms: node.xpath_nodes("*[local-name()='Phase2EncryptionAlgorithm']/*[local-name()='item']").map { |n| Phase2EncryptionAlgorithmsRequestListValue.from_xml(n) },
        phase_1_integrity_algorithms: node.xpath_nodes("*[local-name()='Phase1IntegrityAlgorithm']/*[local-name()='item']").map { |n| Phase1IntegrityAlgorithmsRequestListValue.from_xml(n) },
        phase_2_integrity_algorithms: node.xpath_nodes("*[local-name()='Phase2IntegrityAlgorithm']/*[local-name()='item']").map { |n| Phase2IntegrityAlgorithmsRequestListValue.from_xml(n) },
        phase_1dh_group_numbers: node.xpath_nodes("*[local-name()='Phase1DHGroupNumber']/*[local-name()='item']").map { |n| Phase1DHGroupNumbersRequestListValue.from_xml(n) },
        phase_2dh_group_numbers: node.xpath_nodes("*[local-name()='Phase2DHGroupNumber']/*[local-name()='item']").map { |n| Phase2DHGroupNumbersRequestListValue.from_xml(n) },
        ike_versions: node.xpath_nodes("*[local-name()='IKEVersion']/*[local-name()='item']").map { |n| IKEVersionsRequestListValue.from_xml(n) },
        startup_action: Core::XMLValue.string(node.xpath_node("*[local-name()='StartupAction']")),
        log_options: node.xpath_node("*[local-name()='LogOptions']").try { |n| VpnTunnelLogOptionsSpecification.from_xml(n) },
        enable_tunnel_lifecycle_control: Core::XMLValue.bool(node.xpath_node("*[local-name()='EnableTunnelLifecycleControl']")),
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

    def_equals_and_hash(@tunnel_inside_cidr, @tunnel_inside_ipv_6_cidr, @pre_shared_key, @phase_1_lifetime_seconds, @phase_2_lifetime_seconds, @rekey_margin_time_seconds, @rekey_fuzz_percentage, @replay_window_size, @dpd_timeout_seconds, @dpd_timeout_action, @phase_1_encryption_algorithms, @phase_2_encryption_algorithms, @phase_1_integrity_algorithms, @phase_2_integrity_algorithms, @phase_1dh_group_numbers, @phase_2dh_group_numbers, @ike_versions, @startup_action, @log_options, @enable_tunnel_lifecycle_control)
  end
end
