private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The default instance metadata service (IMDS) settings that were set at the account level in the
  # specified Amazon Web Services Region.
  class InstanceMetadataDefaultsResponse
    # Indicates whether IMDSv2 is required.
    #
    # - `optional` – IMDSv2 is optional, which means that you can use either IMDSv2 or IMDSv1.
    #
    # - `required` – IMDSv2 is required, which means that IMDSv1 is disabled, and you must use IMDSv2.
    property http_tokens : HttpTokensState | Nil

    # The maximum number of hops that the metadata token can travel.
    property http_put_response_hop_limit : Int32 | Nil

    # Indicates whether the IMDS endpoint for an instance is enabled or disabled. When disabled, the
    # instance metadata can't be accessed.
    property http_endpoint : InstanceMetadataEndpointState | Nil

    # Indicates whether access to instance tags from the instance metadata is enabled or disabled. For
    # more information, see [View tags for your EC2 instances using instance
    # metadata](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/work-with-tags-in-IMDS.html) in
    # the *Amazon EC2 User Guide*.
    property instance_metadata_tags : InstanceMetadataTagsState | Nil

    # The entity that manages the IMDS default settings. Possible values include:
    #
    # - `account` - The IMDS default settings are managed by the account.
    #
    # - `declarative-policy` - The IMDS default settings are managed by a declarative policy and can't
    # be modified by the account.
    property managed_by : ManagedBy | Nil

    # The customized exception message that is specified in the declarative policy.
    property managed_exception_message : String | Nil

    # Indicates whether to enforce the requirement of IMDSv2 on an instance at the time of launch.
    # When enforcement is enabled, the instance can't launch unless IMDSv2 (`HttpTokens`) is set to
    # `required`.
    property http_tokens_enforced : HttpTokensEnforcedState | Nil

    def initialize(
      @http_tokens : HttpTokensState | Nil = nil,
      @http_put_response_hop_limit : Int32 | Nil = nil,
      @http_endpoint : InstanceMetadataEndpointState | Nil = nil,
      @instance_metadata_tags : InstanceMetadataTagsState | Nil = nil,
      @managed_by : ManagedBy | Nil = nil,
      @managed_exception_message : String | Nil = nil,
      @http_tokens_enforced : HttpTokensEnforcedState | Nil = nil,
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

      if value = @managed_by
        params << {"#{prefix}ManagedBy", value.to_json_object_key}
      end

      if value = @managed_exception_message
        params << {"#{prefix}ManagedExceptionMessage", value}
      end

      if value = @http_tokens_enforced
        params << {"#{prefix}HttpTokensEnforced", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        http_tokens: (n = node.xpath_node("*[local-name()='httpTokens']")) ? AEC::HttpTokensState.from_json_object_key?(n.content) : nil,
        http_put_response_hop_limit: Core::XMLValue.i32(node.xpath_node("*[local-name()='httpPutResponseHopLimit']")),
        http_endpoint: (n = node.xpath_node("*[local-name()='httpEndpoint']")) ? AEC::InstanceMetadataEndpointState.from_json_object_key?(n.content) : nil,
        instance_metadata_tags: (n = node.xpath_node("*[local-name()='instanceMetadataTags']")) ? AEC::InstanceMetadataTagsState.from_json_object_key?(n.content) : nil,
        managed_by: (n = node.xpath_node("*[local-name()='managedBy']")) ? AEC::ManagedBy.from_json_object_key?(n.content) : nil,
        managed_exception_message: Core::XMLValue.string(node.xpath_node("*[local-name()='managedExceptionMessage']")),
        http_tokens_enforced: (n = node.xpath_node("*[local-name()='httpTokensEnforced']")) ? AEC::HttpTokensEnforcedState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@http_tokens, @http_put_response_hop_limit, @http_endpoint, @instance_metadata_tags, @managed_by, @managed_exception_message, @http_tokens_enforced)
  end
end
