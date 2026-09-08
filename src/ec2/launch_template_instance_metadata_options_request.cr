private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The metadata options for the instance. For more information, see [Use instance metadata to
  # manage your EC2
  # instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html) in the
  # *Amazon EC2 User Guide*.
  class LaunchTemplateInstanceMetadataOptionsRequest
    # Indicates whether IMDSv2 is required.
    #
    # - `optional` - IMDSv2 is optional. You can choose whether to send a session token in your
    # instance metadata retrieval requests. If you retrieve IAM role credentials without a session
    # token, you receive the IMDSv1 role credentials. If you retrieve IAM role credentials using a
    # valid session token, you receive the IMDSv2 role credentials.
    #
    # - `required` - IMDSv2 is required. You must send a session token in your instance metadata
    # retrieval requests. With this option, retrieving the IAM role credentials always returns IMDSv2
    # credentials; IMDSv1 credentials are not available.
    #
    # Default: If the value of `ImdsSupport` for the Amazon Machine Image (AMI) for your instance is
    # `v2.0`, the default is `required`.
    property http_tokens : LaunchTemplateHttpTokensState | Nil

    # The desired HTTP PUT response hop limit for instance metadata requests. The larger the number,
    # the further instance metadata requests can travel.
    #
    # Default: `1`
    #
    # Possible values: Integers from 1 to 64
    property http_put_response_hop_limit : Int32 | Nil

    # Enables or disables the HTTP metadata endpoint on your instances. If the parameter is not
    # specified, the default state is `enabled`.
    #
    # If you specify a value of `disabled`, you will not be able to access your instance metadata.
    property http_endpoint : LaunchTemplateInstanceMetadataEndpointState | Nil

    # Enables or disables the IPv6 endpoint for the instance metadata service.
    #
    # Default: `disabled`
    property http_protocol_ipv_6 : LaunchTemplateInstanceMetadataProtocolIpv6 | Nil

    # Set to `enabled` to allow access to instance tags from the instance metadata. Set to `disabled`
    # to turn off access to instance tags from the instance metadata. For more information, see [View
    # tags for your EC2 instances using instance
    # metadata](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/work-with-tags-in-IMDS.html).
    #
    # Default: `disabled`
    property instance_metadata_tags : LaunchTemplateInstanceMetadataTagsState | Nil

    def initialize(
      @http_tokens : LaunchTemplateHttpTokensState | Nil = nil,
      @http_put_response_hop_limit : Int32 | Nil = nil,
      @http_endpoint : LaunchTemplateInstanceMetadataEndpointState | Nil = nil,
      @http_protocol_ipv_6 : LaunchTemplateInstanceMetadataProtocolIpv6 | Nil = nil,
      @instance_metadata_tags : LaunchTemplateInstanceMetadataTagsState | Nil = nil,
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
        http_tokens: (n = node.xpath_node("*[local-name()='HttpTokens']")) ? AEC::LaunchTemplateHttpTokensState.from_json_object_key?(n.content) : nil,
        http_put_response_hop_limit: Core::XMLValue.i32(node.xpath_node("*[local-name()='HttpPutResponseHopLimit']")),
        http_endpoint: (n = node.xpath_node("*[local-name()='HttpEndpoint']")) ? AEC::LaunchTemplateInstanceMetadataEndpointState.from_json_object_key?(n.content) : nil,
        http_protocol_ipv_6: (n = node.xpath_node("*[local-name()='HttpProtocolIpv6']")) ? AEC::LaunchTemplateInstanceMetadataProtocolIpv6.from_json_object_key?(n.content) : nil,
        instance_metadata_tags: (n = node.xpath_node("*[local-name()='InstanceMetadataTags']")) ? AEC::LaunchTemplateInstanceMetadataTagsState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@http_tokens, @http_put_response_hop_limit, @http_endpoint, @http_protocol_ipv_6, @instance_metadata_tags)
  end
end
