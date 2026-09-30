private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The metadata options for the instance.
  class InstanceMetadataOptionsRequest
    # Indicates whether IMDSv2 is required.
    #
    # - `optional` - IMDSv2 is optional, which means that you can use either IMDSv2 or IMDSv1.
    #
    # - `required` - IMDSv2 is required, which means that IMDSv1 is disabled, and you must use IMDSv2.
    #
    # Default:
    #
    # - If the value of `ImdsSupport` for the Amazon Machine Image (AMI) for your instance is `v2.0`
    # and the account level default is set to `no-preference`, the default is `required`.
    #
    # - If the value of `ImdsSupport` for the Amazon Machine Image (AMI) for your instance is `v2.0`,
    # but the account level default is set to `V1 or V2`, the default is `optional`.
    #
    # The default value can also be affected by other combinations of parameters. For more
    # information, see [Order of precedence for instance metadata
    # options](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configuring-instance-metadata-options.html#instance-metadata-options-order-of-precedence)
    # in the *Amazon EC2 User Guide*.
    property http_tokens : HttpTokensState | Nil

    # The maximum number of hops that the metadata token can travel.
    #
    # Possible values: Integers from 1 to 64
    property http_put_response_hop_limit : Int32 | Nil

    # Enables or disables the HTTP metadata endpoint on your instances.
    #
    # If you specify a value of `disabled`, you cannot access your instance metadata.
    #
    # Default: `enabled`
    property http_endpoint : InstanceMetadataEndpointState | Nil

    # Enables or disables the IPv6 endpoint for the instance metadata service.
    #
    # Default: `disabled`
    property http_protocol_ipv_6 : InstanceMetadataProtocolState | Nil

    # Set to `enabled` to allow access to instance tags from the instance metadata. Set to `disabled`
    # to turn off access to instance tags from the instance metadata. For more information, see [View
    # tags for your EC2 instances using instance
    # metadata](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/work-with-tags-in-IMDS.html).
    #
    # Default: `disabled`
    property instance_metadata_tags : InstanceMetadataTagsState | Nil

    def initialize(
      @http_tokens : HttpTokensState | Nil = nil,
      @http_put_response_hop_limit : Int32 | Nil = nil,
      @http_endpoint : InstanceMetadataEndpointState | Nil = nil,
      @http_protocol_ipv_6 : InstanceMetadataProtocolState | Nil = nil,
      @instance_metadata_tags : InstanceMetadataTagsState | Nil = nil,
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
        http_tokens: (n = node.xpath_node("*[local-name()='HttpTokens']")) ? AEC::HttpTokensState.from_json_object_key?(n.content) : nil,
        http_put_response_hop_limit: Core::XMLValue.i32(node.xpath_node("*[local-name()='HttpPutResponseHopLimit']")),
        http_endpoint: (n = node.xpath_node("*[local-name()='HttpEndpoint']")) ? AEC::InstanceMetadataEndpointState.from_json_object_key?(n.content) : nil,
        http_protocol_ipv_6: (n = node.xpath_node("*[local-name()='HttpProtocolIpv6']")) ? AEC::InstanceMetadataProtocolState.from_json_object_key?(n.content) : nil,
        instance_metadata_tags: (n = node.xpath_node("*[local-name()='InstanceMetadataTags']")) ? AEC::InstanceMetadataTagsState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@http_tokens, @http_put_response_hop_limit, @http_endpoint, @http_protocol_ipv_6, @instance_metadata_tags)
  end
end
