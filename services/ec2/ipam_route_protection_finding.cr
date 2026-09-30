private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains information about a route protection finding, including the RPKI validation status of a
  # BYOIP route announcement.
  class IpamRouteProtectionFinding
    # The ID of the resource owner.
    property resource_owner_id : String | Nil

    # The Amazon Web Services Region of the resource.
    property resource_region : String | Nil

    # The ID of the IPAM pool associated with the finding.
    property ipam_pool_id : String | Nil

    # The IP address prefix in CIDR notation.
    property cidr : String | Nil

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

    # The advertisement type. Possible values:
    #
    # - `regional` - The IP address is advertised from a single location (regional services such as
    # Amazon EC2).
    #
    # - `global` - The IP address is advertised from multiple global locations simultaneously (global
    # services such as Amazon CloudFront).
    property advertisement_type : IpamByoipAdvertisementType | Nil

    # The network border group.
    property network_border_group : String | Nil

    # The ID of the BYOIP pool.
    property pool_id : String | Nil

    # The Autonomous System Number (ASN) that originates the route.
    property asn : String | Nil

    # The RPKI validation status of the route. Possible values:
    #
    # - `valid` - The route has a matching ROA that covers the prefix and origin ASN.
    #
    # - `invalid` - The route has a ROA for the prefix, but the origin ASN or prefix length does not
    # match.
    #
    # - `unknown` - No ROA exists for the prefix, so RPKI validation cannot be performed.
    property rpki_status : IpamRpkiStatus | Nil

    # The RPKI enforcement strength for the route. Possible values:
    #
    # - `strict` - Invalid routes are rejected.
    #
    # - `permissive` - Invalid routes are accepted but flagged.
    property rpki_strength : IpamRpkiStrength | Nil

    # The Route Origin Authorizations (ROAs) that cover the prefix.
    property roas : Array(IpamRouteOriginAuthorization) | Nil

    # The overlapping routes detected for this prefix.
    property route_overlaps : Array(IpamRouteOverlap) | Nil

    # The time when the route was last sampled.
    property sample_time : Time | Nil

    # The time when the ROA data was last sampled.
    property roa_sample_time : Time | Nil

    def initialize(
      @resource_owner_id : String | Nil = nil,
      @resource_region : String | Nil = nil,
      @ipam_pool_id : String | Nil = nil,
      @cidr : String | Nil = nil,
      @state : IpamByoipCidrState | Nil = nil,
      @advertisement_type : IpamByoipAdvertisementType | Nil = nil,
      @network_border_group : String | Nil = nil,
      @pool_id : String | Nil = nil,
      @asn : String | Nil = nil,
      @rpki_status : IpamRpkiStatus | Nil = nil,
      @rpki_strength : IpamRpkiStrength | Nil = nil,
      @roas : Array(IpamRouteOriginAuthorization) | Nil = nil,
      @route_overlaps : Array(IpamRouteOverlap) | Nil = nil,
      @sample_time : Time | Nil = nil,
      @roa_sample_time : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @resource_owner_id
        params << {"#{prefix}ResourceOwnerId", value}
      end

      if value = @resource_region
        params << {"#{prefix}ResourceRegion", value}
      end

      if value = @ipam_pool_id
        params << {"#{prefix}IpamPoolId", value}
      end

      if value = @cidr
        params << {"#{prefix}Cidr", value}
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

      if value = @asn
        params << {"#{prefix}Asn", value}
      end

      if value = @rpki_status
        params << {"#{prefix}RpkiStatus", value.to_json_object_key}
      end

      if value = @rpki_strength
        params << {"#{prefix}RpkiStrength", value.to_json_object_key}
      end

      (@roas || [] of IpamRouteOriginAuthorization).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RoaSet.#{i}."))
      end

      (@route_overlaps || [] of IpamRouteOverlap).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RouteOverlapSet.#{i}."))
      end

      if value = @sample_time
        params << {"#{prefix}SampleTime", Core::QueryValue.time(value)}
      end

      if value = @roa_sample_time
        params << {"#{prefix}RoaSampleTime", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource_owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceOwnerId']")),
        resource_region: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceRegion']")),
        ipam_pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamPoolId']")),
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='cidr']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::IpamByoipCidrState.from_json_object_key?(n.content) : nil,
        advertisement_type: (n = node.xpath_node("*[local-name()='advertisementType']")) ? AEC::IpamByoipAdvertisementType.from_json_object_key?(n.content) : nil,
        network_border_group: Core::XMLValue.string(node.xpath_node("*[local-name()='networkBorderGroup']")),
        pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='poolId']")),
        asn: Core::XMLValue.string(node.xpath_node("*[local-name()='asn']")),
        rpki_status: (n = node.xpath_node("*[local-name()='rpkiStatus']")) ? AEC::IpamRpkiStatus.from_json_object_key?(n.content) : nil,
        rpki_strength: (n = node.xpath_node("*[local-name()='rpkiStrength']")) ? AEC::IpamRpkiStrength.from_json_object_key?(n.content) : nil,
        roas: node.xpath_nodes("*[local-name()='roaSet']/*[local-name()='item']").map { |n| IpamRouteOriginAuthorization.from_xml(n) },
        route_overlaps: node.xpath_nodes("*[local-name()='routeOverlapSet']/*[local-name()='item']").map { |n| IpamRouteOverlap.from_xml(n) },
        sample_time: Core::XMLValue.time(node.xpath_node("*[local-name()='sampleTime']")),
        roa_sample_time: Core::XMLValue.time(node.xpath_node("*[local-name()='roaSampleTime']")),
      )
    end

    def validate! : Nil
      if value = @roas
        value.each(&.validate!)
      end

      if value = @route_overlaps
        raise Core::ValidationError.new("RouteOverlaps must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("RouteOverlaps must have at most 100 item(s)") if value.size > 100
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@resource_owner_id, @resource_region, @ipam_pool_id, @cidr, @state, @advertisement_type, @network_border_group, @pool_id, @asn, @rpki_status, @rpki_strength, @roas, @route_overlaps, @sample_time, @roa_sample_time)
  end
end
