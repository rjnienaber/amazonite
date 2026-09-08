private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # Describes a custom configuration for a System Integrity Protection (SIP) modification task.
  class MacSystemIntegrityProtectionConfigurationRequest
    # Enables or disables Apple Internal.
    property apple_internal : MacSystemIntegrityProtectionSettingStatus | Nil

    # Enables or disables Base System.
    property base_system : MacSystemIntegrityProtectionSettingStatus | Nil

    # Enables or disables Debugging Restrictions.
    property debugging_restrictions : MacSystemIntegrityProtectionSettingStatus | Nil

    # Enables or disables Dtrace Restrictions.
    property d_trace_restrictions : MacSystemIntegrityProtectionSettingStatus | Nil

    # Enables or disables Filesystem Protections.
    property filesystem_protections : MacSystemIntegrityProtectionSettingStatus | Nil

    # Enables or disables Kext Signing.
    property kext_signing : MacSystemIntegrityProtectionSettingStatus | Nil

    # Enables or disables Nvram Protections.
    property nvram_protections : MacSystemIntegrityProtectionSettingStatus | Nil

    def initialize(
      @apple_internal : MacSystemIntegrityProtectionSettingStatus | Nil = nil,
      @base_system : MacSystemIntegrityProtectionSettingStatus | Nil = nil,
      @debugging_restrictions : MacSystemIntegrityProtectionSettingStatus | Nil = nil,
      @d_trace_restrictions : MacSystemIntegrityProtectionSettingStatus | Nil = nil,
      @filesystem_protections : MacSystemIntegrityProtectionSettingStatus | Nil = nil,
      @kext_signing : MacSystemIntegrityProtectionSettingStatus | Nil = nil,
      @nvram_protections : MacSystemIntegrityProtectionSettingStatus | Nil = nil,
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
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        apple_internal: (n = node.xpath_node("*[local-name()='AppleInternal']")) ? AEC::MacSystemIntegrityProtectionSettingStatus.from_json_object_key?(n.content) : nil,
        base_system: (n = node.xpath_node("*[local-name()='BaseSystem']")) ? AEC::MacSystemIntegrityProtectionSettingStatus.from_json_object_key?(n.content) : nil,
        debugging_restrictions: (n = node.xpath_node("*[local-name()='DebuggingRestrictions']")) ? AEC::MacSystemIntegrityProtectionSettingStatus.from_json_object_key?(n.content) : nil,
        d_trace_restrictions: (n = node.xpath_node("*[local-name()='DTraceRestrictions']")) ? AEC::MacSystemIntegrityProtectionSettingStatus.from_json_object_key?(n.content) : nil,
        filesystem_protections: (n = node.xpath_node("*[local-name()='FilesystemProtections']")) ? AEC::MacSystemIntegrityProtectionSettingStatus.from_json_object_key?(n.content) : nil,
        kext_signing: (n = node.xpath_node("*[local-name()='KextSigning']")) ? AEC::MacSystemIntegrityProtectionSettingStatus.from_json_object_key?(n.content) : nil,
        nvram_protections: (n = node.xpath_node("*[local-name()='NvramProtections']")) ? AEC::MacSystemIntegrityProtectionSettingStatus.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@apple_internal, @base_system, @debugging_restrictions, @d_trace_restrictions, @filesystem_protections, @kext_signing, @nvram_protections)
  end
end
