private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteCoipCidrResult
    # Information about a range of customer-owned IP addresses.
    property coip_cidr : CoipCidr | Nil

    def initialize(
      @coip_cidr : CoipCidr | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @coip_cidr
        params.concat(value.to_query_params("#{prefix}CoipCidr."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        coip_cidr: node.xpath_node("*[local-name()='coipCidr']").try { |n| CoipCidr.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @coip_cidr
        value.validate!
      end
    end

    def_equals_and_hash(@coip_cidr)
  end
end
