private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteIpamPoolResult
    # Information about the results of the deletion.
    property ipam_pool : IpamPool | Nil

    def initialize(
      @ipam_pool : IpamPool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipam_pool
        params.concat(value.to_query_params("#{prefix}IpamPool."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_pool: node.xpath_node("*[local-name()='ipamPool']").try { |n| IpamPool.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ipam_pool
        value.validate!
      end
    end

    def_equals_and_hash(@ipam_pool)
  end
end
