private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # The current status of Bidirectional Forwarding Detection (BFD) for a BGP session.
  class RouteServerBfdStatus
    # The operational status of the BFD session.
    property status : RouteServerBfdState | Nil

    def initialize(
      @status : RouteServerBfdState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::RouteServerBfdState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@status)
  end
end
