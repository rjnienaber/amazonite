private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the metadata options for the instances. Supported only for fleets of type `instant`.
  class FleetInstanceMetadataOptionsRequest
    # Indicates whether IMDSv2 is required.
    #
    # - `optional` - IMDSv2 is optional, which means that you can use either IMDSv2 or IMDSv1.
    #
    # - `required` - IMDSv2 is required, which means that IMDSv1 is disabled, and you must use IMDSv2.
    property http_tokens : FleetHttpTokensState | Nil

    # The desired HTTP PUT response hop limit for instance metadata requests. The larger the number,
    # the further instance metadata requests can travel.
    #
    # Default: `1`
    #
    # Possible values: Integers from 1 to 64
    property http_put_response_hop_limit : Int32 | Nil

    # Enables or disables the HTTP metadata endpoint on your instances.
    #
    # - `enabled` - The HTTP metadata endpoint is enabled.
    #
    # - `disabled` - The HTTP metadata endpoint is disabled.
    property http_endpoint : FleetInstanceMetadataEndpointState | Nil

    def initialize(
      @http_tokens : FleetHttpTokensState | Nil = nil,
      @http_put_response_hop_limit : Int32 | Nil = nil,
      @http_endpoint : FleetInstanceMetadataEndpointState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @http_tokens
        params << {"#{prefix}HttpTokens", value.to_json_object_key}
      end

      if value = @http_put_response_hop_limit
        params << {"#{prefix}HttpPutResponseHopLimit", value.to_s}
      end

      if value = @http_endpoint
        params << {"#{prefix}HttpEndpoint", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        http_tokens: (n = node.xpath_node("*[local-name()='HttpTokens']")) ? AEC::FleetHttpTokensState.from_json_object_key?(n.content) : nil,
        http_put_response_hop_limit: Core::XMLValue.i32(node.xpath_node("*[local-name()='HttpPutResponseHopLimit']")),
        http_endpoint: (n = node.xpath_node("*[local-name()='HttpEndpoint']")) ? AEC::FleetInstanceMetadataEndpointState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@http_tokens, @http_put_response_hop_limit, @http_endpoint)
  end
end
