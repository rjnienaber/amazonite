private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # Describes the configuration for a System Integrity Protection (SIP) modification task.
  class MacSystemIntegrityProtectionConfiguration
    # Indicates whether Apple Internal was enabled or disabled by the task.
    property apple_internal : MacSystemIntegrityProtectionSettingStatus | Nil

    # Indicates whether Base System was enabled or disabled by the task.
    property base_system : MacSystemIntegrityProtectionSettingStatus | Nil

    # Indicates whether Debugging Restrictions was enabled or disabled by the task.
    property debugging_restrictions : MacSystemIntegrityProtectionSettingStatus | Nil

    # Indicates whether Dtrace Restrictions was enabled or disabled by the task.
    property d_trace_restrictions : MacSystemIntegrityProtectionSettingStatus | Nil

    # Indicates whether Filesystem Protections was enabled or disabled by the task.
    property filesystem_protections : MacSystemIntegrityProtectionSettingStatus | Nil

    # Indicates whether Kext Signing was enabled or disabled by the task.
    property kext_signing : MacSystemIntegrityProtectionSettingStatus | Nil

    # Indicates whether NVRAM Protections was enabled or disabled by the task.
    property nvram_protections : MacSystemIntegrityProtectionSettingStatus | Nil

    # Indicates SIP was enabled or disabled by the task.
    property status : MacSystemIntegrityProtectionSettingStatus | Nil

    def initialize(
      @apple_internal : MacSystemIntegrityProtectionSettingStatus | Nil = nil,
      @base_system : MacSystemIntegrityProtectionSettingStatus | Nil = nil,
      @debugging_restrictions : MacSystemIntegrityProtectionSettingStatus | Nil = nil,
      @d_trace_restrictions : MacSystemIntegrityProtectionSettingStatus | Nil = nil,
      @filesystem_protections : MacSystemIntegrityProtectionSettingStatus | Nil = nil,
      @kext_signing : MacSystemIntegrityProtectionSettingStatus | Nil = nil,
      @nvram_protections : MacSystemIntegrityProtectionSettingStatus | Nil = nil,
      @status : MacSystemIntegrityProtectionSettingStatus | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @apple_internal
        params << {"#{prefix}AppleInternal", value.to_json_object_key}
      end

      if value = @base_system
        params << {"#{prefix}BaseSystem", value.to_json_object_key}
      end

      if value = @debugging_restrictions
        params << {"#{prefix}DebuggingRestrictions", value.to_json_object_key}
      end

      if value = @d_trace_restrictions
        params << {"#{prefix}DTraceRestrictions", value.to_json_object_key}
      end

      if value = @filesystem_protections
        params << {"#{prefix}FilesystemProtections", value.to_json_object_key}
      end

      if value = @kext_signing
        params << {"#{prefix}KextSigning", value.to_json_object_key}
      end

      if value = @nvram_protections
        params << {"#{prefix}NvramProtections", value.to_json_object_key}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        apple_internal: (n = node.xpath_node("*[local-name()='appleInternal']")) ? AEC::MacSystemIntegrityProtectionSettingStatus.from_json_object_key?(n.content) : nil,
        base_system: (n = node.xpath_node("*[local-name()='baseSystem']")) ? AEC::MacSystemIntegrityProtectionSettingStatus.from_json_object_key?(n.content) : nil,
        debugging_restrictions: (n = node.xpath_node("*[local-name()='debuggingRestrictions']")) ? AEC::MacSystemIntegrityProtectionSettingStatus.from_json_object_key?(n.content) : nil,
        d_trace_restrictions: (n = node.xpath_node("*[local-name()='dTraceRestrictions']")) ? AEC::MacSystemIntegrityProtectionSettingStatus.from_json_object_key?(n.content) : nil,
        filesystem_protections: (n = node.xpath_node("*[local-name()='filesystemProtections']")) ? AEC::MacSystemIntegrityProtectionSettingStatus.from_json_object_key?(n.content) : nil,
        kext_signing: (n = node.xpath_node("*[local-name()='kextSigning']")) ? AEC::MacSystemIntegrityProtectionSettingStatus.from_json_object_key?(n.content) : nil,
        nvram_protections: (n = node.xpath_node("*[local-name()='nvramProtections']")) ? AEC::MacSystemIntegrityProtectionSettingStatus.from_json_object_key?(n.content) : nil,
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::MacSystemIntegrityProtectionSettingStatus.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@apple_internal, @base_system, @debugging_restrictions, @d_trace_restrictions, @filesystem_protections, @kext_signing, @nvram_protections, @status)
  end
end
