private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains information about a BGP route discovered by IPAM resource discovery.
  class IpamDiscoveredRoute
    # The ID of the IPAM resource discovery that discovered the route.
    property ipam_resource_discovery_id : String | Nil

    # The Amazon Web Services Region where the route was discovered.
    property resource_region : String | Nil

    # The ID of the resource owner.
    property resource_owner_id : String | Nil

    # The IP address prefix of the discovered route in CIDR notation.
    property cidr : String | Nil

    # The Autonomous System Number (ASN) that originates the route.
    property asn : String | Nil

    # The state of the BYOIP CIDR. Possible values:
    #
    # - `advertised` - The CIDR is being advertised.
    #
    # - `deprovisioned` - The CIDR has been deprovisioned.
    #
    # - `failed-deprovision` - Deprovisioning failed.
    #
    # - `failed-provision` - Provisioning failed.
    #
    # - `pending-deprovision` - Deprovisioning is in progress.
    #
    # - `pending-provision` - Provisioning is in progress.
    #
    # - `provisioned` - The CIDR is provisioned.
    #
    # - `provisioned-not-publicly-advertisable` - The CIDR is provisioned but not publicly
    # advertisable.
    property state : IpamByoipCidrState | Nil

    # The advertisement type of the route. Possible values:
    #
    # - `regional` - The IP address is advertised from a single location (regional services such as
    # Amazon EC2).
    #
    # - `global` - The IP address is advertised from multiple global locations simultaneously (global
    # services such as Amazon CloudFront).
    property advertisement_type : IpamByoipAdvertisementType | Nil

    # The network border group for the route.
    property network_border_group : String | Nil

    # The ID of the BYOIP pool associated with the route.
    property pool_id : String | Nil

    # The ID of the IPAM pool associated with the route.
    property ipam_pool_id : String | Nil

    # The time when the route was last sampled.
    property sample_time : Time | Nil

    def initialize(
      @ipam_resource_discovery_id : String | Nil = nil,
      @resource_region : String | Nil = nil,
      @resource_owner_id : String | Nil = nil,
      @cidr : String | Nil = nil,
      @asn : String | Nil = nil,
      @state : IpamByoipCidrState | Nil = nil,
      @advertisement_type : IpamByoipAdvertisementType | Nil = nil,
      @network_border_group : String | Nil = nil,
      @pool_id : String | Nil = nil,
      @ipam_pool_id : String | Nil = nil,
      @sample_time : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipam_resource_discovery_id
        params << {"#{prefix}IpamResourceDiscoveryId", value}
      end

      if value = @resource_region
        params << {"#{prefix}ResourceRegion", value}
      end

      if value = @resource_owner_id
        params << {"#{prefix}ResourceOwnerId", value}
      end

      if value = @cidr
        params << {"#{prefix}Cidr", value}
      end

      if value = @asn
        params << {"#{prefix}Asn", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @advertisement_type
        params << {"#{prefix}AdvertisementType", value.to_json_object_key}
      end

      if value = @network_border_group
        params << {"#{prefix}NetworkBorderGroup", value}
      end

      if value = @pool_id
        params << {"#{prefix}PoolId", value}
      end

      if value = @ipam_pool_id
        params << {"#{prefix}IpamPoolId", value}
      end

      if value = @sample_time
        params << {"#{prefix}SampleTime", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_resource_discovery_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamResourceDiscoveryId']")),
        resource_region: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceRegion']")),
        resource_owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceOwnerId']")),
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='cidr']")),
        asn: Core::XMLValue.string(node.xpath_node("*[local-name()='asn']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::IpamByoipCidrState.from_json_object_key?(n.content) : nil,
        advertisement_type: (n = node.xpath_node("*[local-name()='advertisementType']")) ? AEC::IpamByoipAdvertisementType.from_json_object_key?(n.content) : nil,
        network_border_group: Core::XMLValue.string(node.xpath_node("*[local-name()='networkBorderGroup']")),
        pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='poolId']")),
        ipam_pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamPoolId']")),
        sample_time: Core::XMLValue.time(node.xpath_node("*[local-name()='sampleTime']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@ipam_resource_discovery_id, @resource_region, @resource_owner_id, @cidr, @asn, @state, @advertisement_type, @network_border_group, @pool_id, @ipam_pool_id, @sample_time)
  end
end
