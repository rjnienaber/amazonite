private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ExportVerifiedAccessInstanceClientConfigurationResult
    # The version.
    property version : String | Nil

    # The ID of the Verified Access instance.
    property verified_access_instance_id : String | Nil

    # The Region.
    property region : String | Nil

    # The device trust providers.
    property device_trust_providers : Array(DeviceTrustProviderType) | Nil

    # The user identity trust provider.
    property user_trust_provider : VerifiedAccessInstanceUserTrustProviderClientConfiguration | Nil

    # The Open VPN configuration.
    property open_vpn_configurations : Array(VerifiedAccessInstanceOpenVpnClientConfiguration) | Nil

    def initialize(
      @version : String | Nil = nil,
      @verified_access_instance_id : String | Nil = nil,
      @region : String | Nil = nil,
      @device_trust_providers : Array(DeviceTrustProviderType) | Nil = nil,
      @user_trust_provider : VerifiedAccessInstanceUserTrustProviderClientConfiguration | Nil = nil,
      @open_vpn_configurations : Array(VerifiedAccessInstanceOpenVpnClientConfiguration) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @version
        params << {"#{prefix}Version", value}
      end

      if value = @verified_access_instance_id
        params << {"#{prefix}VerifiedAccessInstanceId", value}
      end

      if value = @region
        params << {"#{prefix}Region", value}
      end

      (@device_trust_providers || [] of DeviceTrustProviderType).each_with_index(1) do |item, i|
        params << {"#{prefix}DeviceTrustProviderSet.#{i}", item.to_json_object_key}
      end

      if value = @user_trust_provider
        params.concat(value.to_query_params("#{prefix}UserTrustProvider."))
      end

      (@open_vpn_configurations || [] of VerifiedAccessInstanceOpenVpnClientConfiguration).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}OpenVpnConfigurationSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        version: Core::XMLValue.string(node.xpath_node("*[local-name()='version']")),
        verified_access_instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='verifiedAccessInstanceId']")),
        region: Core::XMLValue.string(node.xpath_node("*[local-name()='region']")),
        device_trust_providers: node.xpath_nodes("*[local-name()='deviceTrustProviderSet']/*[local-name()='item']").compact_map { |n| AEC::DeviceTrustProviderType.from_json_object_key?(n.content) },
        user_trust_provider: node.xpath_node("*[local-name()='userTrustProvider']").try { |n| VerifiedAccessInstanceUserTrustProviderClientConfiguration.from_xml(n) },
        open_vpn_configurations: node.xpath_nodes("*[local-name()='openVpnConfigurationSet']/*[local-name()='item']").map { |n| VerifiedAccessInstanceOpenVpnClientConfiguration.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @user_trust_provider
        value.validate!
      end

      if value = @open_vpn_configurations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@version, @verified_access_instance_id, @region, @device_trust_providers, @user_trust_provider, @open_vpn_configurations)
  end
end
