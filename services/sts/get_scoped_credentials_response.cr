private alias Core = Amazonite::Core

module Amazonite::Sts
  # Contains the response to a successful GetScopedCredentials request, including the scoped-down
  # temporary Amazon Web Services credentials and metadata about the resulting session.
  class GetScopedCredentialsResponse
    # The temporary security credentials for the scoped down session, which include an access key ID,
    # a secret access key, and a security token.
    #
    # The size of the security token that STS API operations return is not fixed. We strongly
    # recommend that you make no assumptions about the maximum size.
    property credentials : Credentials | Nil

    # Metadata about the resulting scoped session, including its identifier and ARN. Because the
    # identity does not change, the identifiers reflect the same principal and session name as the
    # calling session.
    property session_info : ScopedSession | Nil

    property session_token_utilization : Int32 | Nil

    property session_token_size : Int32 | Nil

    # `GetScopedCredentials` can be called recursively and `ScopedPoliciesCount` specifies the number
    # of scope down policies applied to the session. Each recursive call adds another scope down
    # policy layer. A maximum of 3 scope down policy layers are allowed per session. If a session
    # already has 3 `GetScopedCredentials` scope-down policies, a subsequent `GetScopedCredentials`
    # call that supplies a `Policy` (attempting to append a fourth scope-down policy) is denied.
    property scoped_policies_count : Int32 | Nil

    # The source identity of the calling session, carried forward unchanged. This operation never sets
    # or modifies the source identity; it reflects the value established when the source identity was
    # first set. For more information, see [Monitor and control actions taken with assumed
    # roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_control-access_monitor.html)
    # in the IAM User Guide.
    property source_identity : String | Nil

    def initialize(
      @credentials : Credentials | Nil = nil,
      @session_info : ScopedSession | Nil = nil,
      @session_token_utilization : Int32 | Nil = nil,
      @session_token_size : Int32 | Nil = nil,
      @scoped_policies_count : Int32 | Nil = nil,
      @source_identity : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @credentials
        params.concat(value.to_query_params("#{prefix}Credentials."))
      end

      if value = @session_info
        params.concat(value.to_query_params("#{prefix}SessionInfo."))
      end

      if value = @session_token_utilization
        params << {"#{prefix}SessionTokenUtilization", value.to_s}
      end

      if value = @session_token_size
        params << {"#{prefix}SessionTokenSize", value.to_s}
      end

      if value = @scoped_policies_count
        params << {"#{prefix}ScopedPoliciesCount", value.to_s}
      end

      if value = @source_identity
        params << {"#{prefix}SourceIdentity", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        credentials: node.xpath_node("*[local-name()='Credentials']").try { |n| Credentials.from_xml(n) },
        session_info: node.xpath_node("*[local-name()='SessionInfo']").try { |n| ScopedSession.from_xml(n) },
        session_token_utilization: Core::XMLValue.i32(node.xpath_node("*[local-name()='SessionTokenUtilization']")),
        session_token_size: Core::XMLValue.i32(node.xpath_node("*[local-name()='SessionTokenSize']")),
        scoped_policies_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='ScopedPoliciesCount']")),
        source_identity: Core::XMLValue.string(node.xpath_node("*[local-name()='SourceIdentity']")),
      )
    end

    def validate! : Nil
      if value = @credentials
        value.validate!
      end

      if value = @session_info
        value.validate!
      end

      if value = @session_token_utilization
        raise Core::ValidationError.new("SessionTokenUtilization value must be >= 0") if value < 0
      end

      if value = @session_token_size
        raise Core::ValidationError.new("SessionTokenSize value must be >= 0") if value < 0
      end

      if value = @scoped_policies_count
        raise Core::ValidationError.new("ScopedPoliciesCount value must be >= 0") if value < 0
      end

      if value = @source_identity
        raise Core::ValidationError.new("SourceIdentity length must be >= 2") if value.size < 2
        raise Core::ValidationError.new("SourceIdentity length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("SourceIdentity does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]*$"))
      end
    end

    def_equals_and_hash(@credentials, @session_info, @session_token_utilization, @session_token_size, @scoped_policies_count, @source_identity)
  end
end
