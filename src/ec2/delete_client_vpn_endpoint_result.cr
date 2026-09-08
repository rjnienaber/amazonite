private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteClientVpnEndpointResult
    # The current state of the Client VPN endpoint.
    property status : ClientVpnEndpointStatus | Nil

    def initialize(
      @status : ClientVpnEndpointStatus | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @status
        params.concat(value.to_query_params("#{prefix}Status."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        status: node.xpath_node("*[local-name()='status']").try { |n| ClientVpnEndpointStatus.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @status
        value.validate!
      end
    end

    def_equals_and_hash(@status)
  end
end
