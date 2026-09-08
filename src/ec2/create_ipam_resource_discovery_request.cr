private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateIpamResourceDiscoveryRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # A description for the IPAM resource discovery.
    property description : String | Nil

    # Operating Regions for the IPAM resource discovery. Operating Regions are Amazon Web Services
    # Regions where the IPAM is allowed to manage IP address CIDRs. IPAM only discovers and monitors
    # resources in the Amazon Web Services Regions you select as operating Regions.
    property operating_regions : Array(AddIpamOperatingRegion) | Nil

    # Tag specifications for the IPAM resource discovery.
    property tag_specifications : Array(TagSpecification) | Nil

    # A client token for the IPAM resource discovery.
    property client_token : String | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @description : String | Nil = nil,
      @operating_regions : Array(AddIpamOperatingRegion) | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @client_token : String | Nil = nil,
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
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        operating_regions: node.xpath_nodes("*[local-name()='OperatingRegion']/*[local-name()='item']").map { |n| AddIpamOperatingRegion.from_xml(n) },
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
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

    def_equals_and_hash(@dry_run, @description, @operating_regions, @tag_specifications, @client_token)
  end
end
