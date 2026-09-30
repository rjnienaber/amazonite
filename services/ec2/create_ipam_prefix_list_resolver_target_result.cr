private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateIpamPrefixListResolverTargetResult
    # Information about the IPAM prefix list resolver target that was created.
    property ipam_prefix_list_resolver_target : IpamPrefixListResolverTarget | Nil

    def initialize(
      @ipam_prefix_list_resolver_target : IpamPrefixListResolverTarget | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipam_prefix_list_resolver_target
        params.concat(value.to_query_params("#{prefix}IpamPrefixListResolverTarget."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_prefix_list_resolver_target: node.xpath_node("*[local-name()='ipamPrefixListResolverTarget']").try { |n| IpamPrefixListResolverTarget.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ipam_prefix_list_resolver_target
        value.validate!
      end
    end

    def_equals_and_hash(@ipam_prefix_list_resolver_target)
  end
end
