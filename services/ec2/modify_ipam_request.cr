private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyIpamRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the IPAM you want to modify.
    property ipam_id : String

    # The description of the IPAM you want to modify.
    property description : String | Nil

    # Choose the operating Regions for the IPAM. Operating Regions are Amazon Web Services Regions
    # where the IPAM is allowed to manage IP address CIDRs. IPAM only discovers and monitors resources
    # in the Amazon Web Services Regions you select as operating Regions.
    #
    # For more information about operating Regions, see [Create an
    # IPAM](https://docs.aws.amazon.com/vpc/latest/ipam/create-ipam.html) in the *Amazon VPC IPAM User
    # Guide*.
    property add_operating_regions : Array(AddIpamOperatingRegion) | Nil

    # The operating Regions to remove.
    property remove_operating_regions : Array(RemoveIpamOperatingRegion) | Nil

    # IPAM is offered in a Free Tier and an Advanced Tier. For more information about the features
    # available in each tier and the costs associated with the tiers, see [Amazon VPC pricing > IPAM
    # tab](http://aws.amazon.com/vpc/pricing/).
    property tier : IpamTier | Nil

    # Enable this option to use your own GUA ranges as private IPv6 addresses. This option is disabled
    # by default.
    property enable_private_gua : Bool | Nil

    # A metered account is an Amazon Web Services account that is charged for active IP addresses
    # managed in IPAM. For more information, see [Enable cost
    # distribution](https://docs.aws.amazon.com/vpc/latest/ipam/ipam-enable-cost-distro.html) in the
    # *Amazon VPC IPAM User Guide*.
    #
    # Possible values:
    #
    # - `ipam-owner` (default): The Amazon Web Services account which owns the IPAM is charged for all
    # active IP addresses managed in IPAM.
    #
    # - `resource-owner`: The Amazon Web Services account that owns the IP address is charged for the
    # active IP address.
    property metered_account : IpamMeteredAccount | Nil

    def initialize(
      @ipam_id : String,
      @dry_run : Bool | Nil = nil,
      @description : String | Nil = nil,
      @add_operating_regions : Array(AddIpamOperatingRegion) | Nil = nil,
      @remove_operating_regions : Array(RemoveIpamOperatingRegion) | Nil = nil,
      @tier : IpamTier | Nil = nil,
      @enable_private_gua : Bool | Nil = nil,
      @metered_account : IpamMeteredAccount | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}IpamId", @ipam_id}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      (@add_operating_regions || [] of AddIpamOperatingRegion).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AddOperatingRegion.#{i}."))
      end

      (@remove_operating_regions || [] of RemoveIpamOperatingRegion).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RemoveOperatingRegion.#{i}."))
      end

      if value = @tier
        params << {"#{prefix}Tier", value.to_json_object_key}
      end

      if value = @enable_private_gua
        params << {"#{prefix}EnablePrivateGua", Core::QueryValue.bool(value)}
      end

      if value = @metered_account
        params << {"#{prefix}MeteredAccount", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipam_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamId']")).not_nil!,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        add_operating_regions: node.xpath_nodes("*[local-name()='AddOperatingRegion']/*[local-name()='item']").map { |n| AddIpamOperatingRegion.from_xml(n) },
        remove_operating_regions: node.xpath_nodes("*[local-name()='RemoveOperatingRegion']/*[local-name()='item']").map { |n| RemoveIpamOperatingRegion.from_xml(n) },
        tier: (n = node.xpath_node("*[local-name()='Tier']")) ? AEC::IpamTier.from_json_object_key?(n.content) : nil,
        enable_private_gua: Core::XMLValue.bool(node.xpath_node("*[local-name()='EnablePrivateGua']")),
        metered_account: (n = node.xpath_node("*[local-name()='MeteredAccount']")) ? AEC::IpamMeteredAccount.from_json_object_key?(n.content) : nil,
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
    end

    def_equals_and_hash(@dry_run, @ipam_id, @description, @add_operating_regions, @remove_operating_regions, @tier, @enable_private_gua, @metered_account)
  end
end
