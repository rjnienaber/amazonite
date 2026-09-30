private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyInstanceMetadataDefaultsRequest
    # Indicates whether IMDSv2 is required.
    #
    # - `optional` – IMDSv2 is optional, which means that you can use either IMDSv2 or IMDSv1.
    #
    # - `required` – IMDSv2 is required, which means that IMDSv1 is disabled, and you must use IMDSv2.
    property http_tokens : MetadataDefaultHttpTokensState | Nil

    # The maximum number of hops that the metadata token can travel. To indicate no preference,
    # specify `-1`.
    #
    # Possible values: Integers from `1` to `64`, and `-1` to indicate no preference
    property http_put_response_hop_limit : Int32 | Nil

    # Enables or disables the IMDS endpoint on an instance. When disabled, the instance metadata can't
    # be accessed.
    property http_endpoint : DefaultInstanceMetadataEndpointState | Nil

    # Enables or disables access to an instance's tags from the instance metadata. For more
    # information, see [View tags for your EC2 instances using instance
    # metadata](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/work-with-tags-in-IMDS.html) in
    # the *Amazon EC2 User Guide*.
    property instance_metadata_tags : DefaultInstanceMetadataTagsState | Nil

    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Specifies whether to enforce the requirement of IMDSv2 on an instance at the time of launch.
    # When enforcement is enabled, the instance can't launch unless IMDSv2 (`HttpTokens`) is set to
    # `required`. For more information, see [Enforce IMDSv2 at the account
    # level](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configuring-IMDS-new-instances.html#enforce-imdsv2-at-the-account-level)
    # in the *Amazon EC2 User Guide*.
    property http_tokens_enforced : DefaultHttpTokensEnforcedState | Nil

    def initialize(
      @http_tokens : MetadataDefaultHttpTokensState | Nil = nil,
      @http_put_response_hop_limit : Int32 | Nil = nil,
      @http_endpoint : DefaultInstanceMetadataEndpointState | Nil = nil,
      @instance_metadata_tags : DefaultInstanceMetadataTagsState | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @http_tokens_enforced : DefaultHttpTokensEnforcedState | Nil = nil,
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

      if value = @instance_metadata_tags
        params << {"#{prefix}InstanceMetadataTags", value.to_json_object_key}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @http_tokens_enforced
        params << {"#{prefix}HttpTokensEnforced", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        http_tokens: (n = node.xpath_node("*[local-name()='HttpTokens']")) ? AEC::MetadataDefaultHttpTokensState.from_json_object_key?(n.content) : nil,
        http_put_response_hop_limit: Core::XMLValue.i32(node.xpath_node("*[local-name()='HttpPutResponseHopLimit']")),
        http_endpoint: (n = node.xpath_node("*[local-name()='HttpEndpoint']")) ? AEC::DefaultInstanceMetadataEndpointState.from_json_object_key?(n.content) : nil,
        instance_metadata_tags: (n = node.xpath_node("*[local-name()='InstanceMetadataTags']")) ? AEC::DefaultInstanceMetadataTagsState.from_json_object_key?(n.content) : nil,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        http_tokens_enforced: (n = node.xpath_node("*[local-name()='HttpTokensEnforced']")) ? AEC::DefaultHttpTokensEnforcedState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@http_tokens, @http_put_response_hop_limit, @http_endpoint, @instance_metadata_tags, @dry_run, @http_tokens_enforced)
  end
end
