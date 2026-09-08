private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # A resource discovery is an IPAM component that enables IPAM to manage and monitor resources that
  # belong to the owning account.
  class IpamResourceDiscovery
    # The ID of the owner.
    property owner_id : String | Nil

    # The resource discovery ID.
    property ipam_resource_discovery_id : String | Nil

    # The resource discovery Amazon Resource Name (ARN).
    property ipam_resource_discovery_arn : String | Nil

    # The resource discovery Region.
    property ipam_resource_discovery_region : String | Nil

    # The resource discovery description.
    property description : String | Nil

    # The operating Regions for the resource discovery. Operating Regions are Amazon Web Services
    # Regions where the IPAM is allowed to manage IP address CIDRs. IPAM only discovers and monitors
    # resources in the Amazon Web Services Regions you select as operating Regions.
    property operating_regions : Array(IpamOperatingRegion) | Nil

    # Defines if the resource discovery is the default. The default resource discovery is the resource
    # discovery automatically created when you create an IPAM.
    property is_default : Bool | Nil

    # The lifecycle state of the resource discovery.
    #
    # - `create-in-progress` - Resource discovery is being created.
    #
    # - `create-complete` - Resource discovery creation is complete.
    #
    # - `create-failed` - Resource discovery creation has failed.
    #
    # - `modify-in-progress` - Resource discovery is being modified.
    #
    # - `modify-complete` - Resource discovery modification is complete.
    #
    # - `modify-failed` - Resource discovery modification has failed.
    #
    # - `delete-in-progress` - Resource discovery is being deleted.
    #
    # - `delete-complete` - Resource discovery deletion is complete.
    #
    # - `delete-failed` - Resource discovery deletion has failed.
    #
    # - `isolate-in-progress` - Amazon Web Services account that created the resource discovery has
    # been removed and the resource discovery is being isolated.
    #
    # - `isolate-complete` - Resource discovery isolation is complete.
    #
    # - `restore-in-progress` - Amazon Web Services account that created the resource discovery and
    # was isolated has been restored.
    property state : IpamResourceDiscoveryState | Nil

    # A tag is a label that you assign to an Amazon Web Services resource. Each tag consists of a key
    # and an optional value. You can use tags to search and filter your resources or track your Amazon
    # Web Services costs.
    property tags : Array(Tag) | Nil

    # If your IPAM is integrated with Amazon Web Services Organizations and you add an organizational
    # unit (OU) exclusion, IPAM will not manage the IP addresses in accounts in that OU exclusion.
    property organizational_unit_exclusions : Array(IpamOrganizationalUnitExclusion) | Nil

    def initialize(
      @owner_id : String | Nil = nil,
      @ipam_resource_discovery_id : String | Nil = nil,
      @ipam_resource_discovery_arn : String | Nil = nil,
      @ipam_resource_discovery_region : String | Nil = nil,
      @description : String | Nil = nil,
      @operating_regions : Array(IpamOperatingRegion) | Nil = nil,
      @is_default : Bool | Nil = nil,
      @state : IpamResourceDiscoveryState | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @organizational_unit_exclusions : Array(IpamOrganizationalUnitExclusion) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @ipam_resource_discovery_id
        params << {"#{prefix}IpamResourceDiscoveryId", value}
      end

      if value = @ipam_resource_discovery_arn
        params << {"#{prefix}IpamResourceDiscoveryArn", value}
      end

      if value = @ipam_resource_discovery_region
        params << {"#{prefix}IpamResourceDiscoveryRegion", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      (@operating_regions || [] of IpamOperatingRegion).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}OperatingRegionSet.#{i}."))
      end

      if value = @is_default
        params << {"#{prefix}IsDefault", Core::QueryValue.bool(value)}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      (@organizational_unit_exclusions || [] of IpamOrganizationalUnitExclusion).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}OrganizationalUnitExclusionSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        ipam_resource_discovery_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamResourceDiscoveryId']")),
        ipam_resource_discovery_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamResourceDiscoveryArn']")),
        ipam_resource_discovery_region: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamResourceDiscoveryRegion']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        operating_regions: node.xpath_nodes("*[local-name()='operatingRegionSet']/*[local-name()='item']").map { |n| IpamOperatingRegion.from_xml(n) },
        is_default: Core::XMLValue.bool(node.xpath_node("*[local-name()='isDefault']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::IpamResourceDiscoveryState.from_json_object_key?(n.content) : nil,
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        organizational_unit_exclusions: node.xpath_nodes("*[local-name()='organizationalUnitExclusionSet']/*[local-name()='item']").map { |n| IpamOrganizationalUnitExclusion.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @operating_regions
        value.each(&.validate!)
      end

      if value = @tags
        value.each(&.validate!)
      end

      if value = @organizational_unit_exclusions
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@owner_id, @ipam_resource_discovery_id, @ipam_resource_discovery_arn, @ipam_resource_discovery_region, @description, @operating_regions, @is_default, @state, @tags, @organizational_unit_exclusions)
  end
end
