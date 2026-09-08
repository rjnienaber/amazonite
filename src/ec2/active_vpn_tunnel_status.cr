private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains information about the current security configuration of an active VPN tunnel.
  class ActiveVpnTunnelStatus
    # The encryption algorithm negotiated in Phase 1 IKE negotiations.
    property phase_1_encryption_algorithm : String | Nil

    # The encryption algorithm negotiated in Phase 2 IKE negotiations.
    property phase_2_encryption_algorithm : String | Nil

    # The integrity algorithm negotiated in Phase 1 IKE negotiations.
    property phase_1_integrity_algorithm : String | Nil

    # The integrity algorithm negotiated in Phase 2 IKE negotiations.
    property phase_2_integrity_algorithm : String | Nil

    # The Diffie-Hellman group number being used in Phase 1 IKE negotiations.
    property phase_1dh_group : Int32 | Nil

    # The Diffie-Hellman group number being used in Phase 2 IKE negotiations.
    property phase_2dh_group : Int32 | Nil

    # The version of the Internet Key Exchange (IKE) protocol being used.
    property ike_version : String | Nil

    # The current provisioning status of the VPN tunnel.
    property provisioning_status : VpnTunnelProvisioningStatus | Nil

    # The reason for the current provisioning status.
    property provisioning_status_reason : String | Nil

    def initialize(
      @phase_1_encryption_algorithm : String | Nil = nil,
      @phase_2_encryption_algorithm : String | Nil = nil,
      @phase_1_integrity_algorithm : String | Nil = nil,
      @phase_2_integrity_algorithm : String | Nil = nil,
      @phase_1dh_group : Int32 | Nil = nil,
      @phase_2dh_group : Int32 | Nil = nil,
      @ike_version : String | Nil = nil,
      @provisioning_status : VpnTunnelProvisioningStatus | Nil = nil,
      @provisioning_status_reason : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @phase_1_encryption_algorithm
        params << {"#{prefix}Phase1EncryptionAlgorithm", value}
      end

      if value = @phase_2_encryption_algorithm
        params << {"#{prefix}Phase2EncryptionAlgorithm", value}
      end

      if value = @phase_1_integrity_algorithm
        params << {"#{prefix}Phase1IntegrityAlgorithm", value}
      end

      if value = @phase_2_integrity_algorithm
        params << {"#{prefix}Phase2IntegrityAlgorithm", value}
      end

      if value = @phase_1dh_group
        params << {"#{prefix}Phase1DHGroup", value.to_s}
      end

      if value = @phase_2dh_group
        params << {"#{prefix}Phase2DHGroup", value.to_s}
      end

      if value = @ike_version
        params << {"#{prefix}IkeVersion", value}
      end

      if value = @provisioning_status
        params << {"#{prefix}ProvisioningStatus", value.to_json_object_key}
      end

      if value = @provisioning_status_reason
        params << {"#{prefix}ProvisioningStatusReason", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        phase_1_encryption_algorithm: Core::XMLValue.string(node.xpath_node("*[local-name()='phase1EncryptionAlgorithm']")),
        phase_2_encryption_algorithm: Core::XMLValue.string(node.xpath_node("*[local-name()='phase2EncryptionAlgorithm']")),
        phase_1_integrity_algorithm: Core::XMLValue.string(node.xpath_node("*[local-name()='phase1IntegrityAlgorithm']")),
        phase_2_integrity_algorithm: Core::XMLValue.string(node.xpath_node("*[local-name()='phase2IntegrityAlgorithm']")),
        phase_1dh_group: Core::XMLValue.i32(node.xpath_node("*[local-name()='phase1DHGroup']")),
        phase_2dh_group: Core::XMLValue.i32(node.xpath_node("*[local-name()='phase2DHGroup']")),
        ike_version: Core::XMLValue.string(node.xpath_node("*[local-name()='ikeVersion']")),
        provisioning_status: (n = node.xpath_node("*[local-name()='provisioningStatus']")) ? AEC::VpnTunnelProvisioningStatus.from_json_object_key?(n.content) : nil,
        provisioning_status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='provisioningStatusReason']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@phase_1_encryption_algorithm, @phase_2_encryption_algorithm, @phase_1_integrity_algorithm, @phase_2_integrity_algorithm, @phase_1dh_group, @phase_2dh_group, @ike_version, @provisioning_status, @provisioning_status_reason)
  end
end
