private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateIpamRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # A description for the IPAM.
    property description : String | Nil

    # The operating Regions for the IPAM. Operating Regions are Amazon Web Services Regions where the
    # IPAM is allowed to manage IP address CIDRs. IPAM only discovers and monitors resources in the
    # Amazon Web Services Regions you select as operating Regions.
    #
    # For more information about operating Regions, see [Create an
    # IPAM](https://docs.aws.amazon.com/vpc/latest/ipam/create-ipam.html) in the *Amazon VPC IPAM User
    # Guide*.
    property operating_regions : Array(AddIpamOperatingRegion) | Nil

    # The key/value combination of a tag assigned to the resource. Use the tag key in the filter name
    # and the tag value as the filter value. For example, to find all resources that have a tag with
    # the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and `TeamA` for
    # the filter value.
    property tag_specifications : Array(TagSpecification) | Nil

    # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
    # For more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

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
      @dry_run : Bool | Nil = nil,
      @description : String | Nil = nil,
      @operating_regions : Array(AddIpamOperatingRegion) | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @client_token : String | Nil = nil,
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

      if value = @description
        params << {"#{prefix}Description", value}
      end

      (@operating_regions || [] of AddIpamOperatingRegion).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}OperatingRegion.#{i}."))
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
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
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        operating_regions: node.xpath_nodes("*[local-name()='OperatingRegion']/*[local-name()='item']").map { |n| AddIpamOperatingRegion.from_xml(n) },
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        tier: (n = node.xpath_node("*[local-name()='Tier']")) ? AEC::IpamTier.from_json_object_key?(n.content) : nil,
        enable_private_gua: Core::XMLValue.bool(node.xpath_node("*[local-name()='EnablePrivateGua']")),
        metered_account: (n = node.xpath_node("*[local-name()='MeteredAccount']")) ? AEC::IpamMeteredAccount.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @operating_regions
        raise Core::ValidationError.new("OperatingRegions must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("OperatingRegions must have at most 50 item(s)") if value.size > 50
        value.each(&.validate!)
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @description, @operating_regions, @tag_specifications, @client_token, @tier, @enable_private_gua, @metered_account)
  end
end
