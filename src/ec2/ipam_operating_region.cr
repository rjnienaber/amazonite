private alias Core = Amazonite::Core

module Amazonite::EC2
  # The operating Regions for an IPAM. Operating Regions are Amazon Web Services Regions where the
  # IPAM is allowed to manage IP address CIDRs. IPAM only discovers and monitors resources in the
  # Amazon Web Services Regions you select as operating Regions.
  #
  # For more information about operating Regions, see [Create an
  # IPAM](https://docs.aws.amazon.com/vpc/latest/ipam/create-ipam.html) in the *Amazon VPC IPAM User
  # Guide*.
  class IpamOperatingRegion
    # The name of the operating Region.
    property region_name : String | Nil

    def initialize(
      @region_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @region_name
        params << {"#{prefix}RegionName", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        region_name: Core::XMLValue.string(node.xpath_node("*[local-name()='regionName']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@region_name)
  end
end
