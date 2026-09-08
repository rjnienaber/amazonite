private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteIpamPrefixListResolverResult
    # Information about the IPAM prefix list resolver that was deleted.
    property ipam_prefix_list_resolver : IpamPrefixListResolver | Nil

    def initialize(
      @ipam_prefix_list_resolver : IpamPrefixListResolver | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipam_prefix_list_resolver
        params.concat(value.to_query_params("#{prefix}IpamPrefixListResolver."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_prefix_list_resolver: node.xpath_node("*[local-name()='ipamPrefixListResolver']").try { |n| IpamPrefixListResolver.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ipam_prefix_list_resolver
        value.validate!
      end
    end

    def_equals_and_hash(@ipam_prefix_list_resolver)
  end
end
