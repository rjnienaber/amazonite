private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateIpamScopeResult
    # Information about the created scope.
    property ipam_scope : IpamScope | Nil

    def initialize(
      @ipam_scope : IpamScope | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipam_scope
        params.concat(value.to_query_params("#{prefix}IpamScope."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_scope: node.xpath_node("*[local-name()='ipamScope']").try { |n| IpamScope.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ipam_scope
        value.validate!
      end
    end

    def_equals_and_hash(@ipam_scope)
  end
end
