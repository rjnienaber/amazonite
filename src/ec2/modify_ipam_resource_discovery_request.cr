private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyIpamResourceDiscoveryRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # A resource discovery ID.
    property ipam_resource_discovery_id : String

    # A resource discovery description.
    property description : String | Nil

    # Add operating Regions to the resource discovery. Operating Regions are Amazon Web Services
    # Regions where the IPAM is allowed to manage IP address CIDRs. IPAM only discovers and monitors
    # resources in the Amazon Web Services Regions you select as operating Regions.
    property add_operating_regions : Array(AddIpamOperatingRegion) | Nil

    # Remove operating Regions.
    property remove_operating_regions : Array(RemoveIpamOperatingRegion) | Nil

    # Add an Organizational Unit (OU) exclusion to your IPAM. If your IPAM is integrated with Amazon
    # Web Services Organizations and you add an organizational unit (OU) exclusion, IPAM will not
    # manage the IP addresses in accounts in that OU exclusion. There is a limit on the number of
    # exclusions you can create. For more information, see [Quotas for your
    # IPAM](https://docs.aws.amazon.com/vpc/latest/ipam/quotas-ipam.html) in the *Amazon VPC IPAM User
    # Guide*.
    #
    # The resulting set of exclusions must not result in "overlap", meaning two or more OU exclusions
    # must not exclude the same OU. For more information and examples, see the Amazon Web Services CLI
    # request process in [Add or remove OU exclusions
    # ](https://docs.aws.amazon.com/vpc/latest/ipam/exclude-ous.html#exclude-ous-create-delete) in the
    # *Amazon VPC User Guide*.
    property add_organizational_unit_exclusions : Array(AddIpamOrganizationalUnitExclusion) | Nil

    # Remove an Organizational Unit (OU) exclusion to your IPAM. If your IPAM is integrated with
    # Amazon Web Services Organizations and you add an organizational unit (OU) exclusion, IPAM will
    # not manage the IP addresses in accounts in that OU exclusion. There is a limit on the number of
    # exclusions you can create. For more information, see [Quotas for your
    # IPAM](https://docs.aws.amazon.com/vpc/latest/ipam/quotas-ipam.html) in the *Amazon VPC IPAM User
    # Guide*.
    #
    # The resulting set of exclusions must not result in "overlap", meaning two or more OU exclusions
    # must not exclude the same OU. For more information and examples, see the Amazon Web Services CLI
    # request process in [Add or remove OU exclusions
    # ](https://docs.aws.amazon.com/vpc/latest/ipam/exclude-ous.html#exclude-ous-create-delete) in the
    # *Amazon VPC User Guide*.
    property remove_organizational_unit_exclusions : Array(RemoveIpamOrganizationalUnitExclusion) | Nil

    def initialize(
      @ipam_resource_discovery_id : String,
      @dry_run : Bool | Nil = nil,
      @description : String | Nil = nil,
      @add_operating_regions : Array(AddIpamOperatingRegion) | Nil = nil,
      @remove_operating_regions : Array(RemoveIpamOperatingRegion) | Nil = nil,
      @add_organizational_unit_exclusions : Array(AddIpamOrganizationalUnitExclusion) | Nil = nil,
      @remove_organizational_unit_exclusions : Array(RemoveIpamOrganizationalUnitExclusion) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}IpamResourceDiscoveryId", @ipam_resource_discovery_id}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      (@add_operating_regions || [] of AddIpamOperatingRegion).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AddOperatingRegion.#{i}."))
      end

      (@remove_operating_regions || [] of RemoveIpamOperatingRegion).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RemoveOperatingRegion.#{i}."))
      end

      (@add_organizational_unit_exclusions || [] of AddIpamOrganizationalUnitExclusion).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AddOrganizationalUnitExclusion.#{i}."))
      end

      (@remove_organizational_unit_exclusions || [] of RemoveIpamOrganizationalUnitExclusion).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RemoveOrganizationalUnitExclusion.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipam_resource_discovery_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamResourceDiscoveryId']")).not_nil!,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        add_operating_regions: node.xpath_nodes("*[local-name()='AddOperatingRegion']/*[local-name()='item']").map { |n| AddIpamOperatingRegion.from_xml(n) },
        remove_operating_regions: node.xpath_nodes("*[local-name()='RemoveOperatingRegion']/*[local-name()='item']").map { |n| RemoveIpamOperatingRegion.from_xml(n) },
        add_organizational_unit_exclusions: node.xpath_nodes("*[local-name()='AddOrganizationalUnitExclusion']/*[local-name()='item']").map { |n| AddIpamOrganizationalUnitExclusion.from_xml(n) },
        remove_organizational_unit_exclusions: node.xpath_nodes("*[local-name()='RemoveOrganizationalUnitExclusion']/*[local-name()='item']").map { |n| RemoveIpamOrganizationalUnitExclusion.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @add_operating_regions
        raise Core::ValidationError.new("AddOperatingRegions must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("AddOperatingRegions must have at most 50 item(s)") if value.size > 50
        value.each(&.validate!)
      end

      if value = @remove_operating_regions
        raise Core::ValidationError.new("RemoveOperatingRegions must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("RemoveOperatingRegions must have at most 50 item(s)") if value.size > 50
        value.each(&.validate!)
      end

      if value = @add_organizational_unit_exclusions
        raise Core::ValidationError.new("AddOrganizationalUnitExclusions must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("AddOrganizationalUnitExclusions must have at most 10 item(s)") if value.size > 10
        value.each(&.validate!)
      end

      if value = @remove_organizational_unit_exclusions
        raise Core::ValidationError.new("RemoveOrganizationalUnitExclusions must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("RemoveOrganizationalUnitExclusions must have at most 10 item(s)") if value.size > 10
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @ipam_resource_discovery_id, @description, @add_operating_regions, @remove_operating_regions, @add_organizational_unit_exclusions, @remove_organizational_unit_exclusions)
  end
end
