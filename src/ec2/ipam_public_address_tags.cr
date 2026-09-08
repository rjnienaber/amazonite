private alias Core = Amazonite::Core

module Amazonite::EC2
  # Tags for a public IP address discovered by IPAM.
  class IpamPublicAddressTags
    # Tags for an Elastic IP address.
    property eip_tags : Array(IpamPublicAddressTag) | Nil

    def initialize(
      @eip_tags : Array(IpamPublicAddressTag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@eip_tags || [] of IpamPublicAddressTag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}EipTagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        eip_tags: node.xpath_nodes("*[local-name()='eipTagSet']/*[local-name()='item']").map { |n| IpamPublicAddressTag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @eip_tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@eip_tags)
  end
end
