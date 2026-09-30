private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The metadata options for the instance.
  class InstanceMetadataOptionsResponse
    # The state of the metadata option changes.
    #
    # `pending` - The metadata options are being updated and the instance is not ready to process
    # metadata traffic with the new selection.
    #
    # `applied` - The metadata options have been successfully applied on the instance.
    property state : InstanceMetadataOptionsState | Nil

    # Indicates whether IMDSv2 is required.
    #
    # - `optional` - IMDSv2 is optional, which means that you can use either IMDSv2 or IMDSv1.
    #
    # - `required` - IMDSv2 is required, which means that IMDSv1 is disabled, and you must use IMDSv2.
    property http_tokens : HttpTokensState | Nil

    # The maximum number of hops that the metadata token can travel.
    #
    # Possible values: Integers from `1` to `64`
    property http_put_response_hop_limit : Int32 | Nil

    # Indicates whether the HTTP metadata endpoint on your instances is enabled or disabled.
    #
    # If the value is `disabled`, you cannot access your instance metadata.
    property http_endpoint : InstanceMetadataEndpointState | Nil

    # Indicates whether the IPv6 endpoint for the instance metadata service is enabled or disabled.
    #
    # Default: `disabled`
    property http_protocol_ipv_6 : InstanceMetadataProtocolState | Nil

    # Indicates whether access to instance tags from the instance metadata is enabled or disabled. For
    # more information, see [View tags for your EC2 instances using instance
    # metadata](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/work-with-tags-in-IMDS.html).
    property instance_metadata_tags : InstanceMetadataTagsState | Nil

    def initialize(
      @state : InstanceMetadataOptionsState | Nil = nil,
      @http_tokens : HttpTokensState | Nil = nil,
      @http_put_response_hop_limit : Int32 | Nil = nil,
      @http_endpoint : InstanceMetadataEndpointState | Nil = nil,
      @http_protocol_ipv_6 : InstanceMetadataProtocolState | Nil = nil,
      @instance_metadata_tags : InstanceMetadataTagsState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @http_tokens
        params << {"#{prefix}HttpTokens", value.to_json_object_key}
      end

      if value = @http_put_response_hop_limit
        params << {"#{prefix}HttpPutResponseHopLimit", value.to_s}
      end

      if value = @http_endpoint
        params << {"#{prefix}HttpEndpoint", value.to_json_object_key}
      end

      if value = @http_protocol_ipv_6
        params << {"#{prefix}HttpProtocolIpv6", value.to_json_object_key}
      end

      if value = @instance_metadata_tags
        params << {"#{prefix}InstanceMetadataTags", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::InstanceMetadataOptionsState.from_json_object_key?(n.content) : nil,
        http_tokens: (n = node.xpath_node("*[local-name()='httpTokens']")) ? AEC::HttpTokensState.from_json_object_key?(n.content) : nil,
        http_put_response_hop_limit: Core::XMLValue.i32(node.xpath_node("*[local-name()='httpPutResponseHopLimit']")),
        http_endpoint: (n = node.xpath_node("*[local-name()='httpEndpoint']")) ? AEC::InstanceMetadataEndpointState.from_json_object_key?(n.content) : nil,
        http_protocol_ipv_6: (n = node.xpath_node("*[local-name()='httpProtocolIpv6']")) ? AEC::InstanceMetadataProtocolState.from_json_object_key?(n.content) : nil,
        instance_metadata_tags: (n = node.xpath_node("*[local-name()='instanceMetadataTags']")) ? AEC::InstanceMetadataTagsState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@state, @http_tokens, @http_put_response_hop_limit, @http_endpoint, @http_protocol_ipv_6, @instance_metadata_tags)
  end
end
