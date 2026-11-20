private alias AS = Amazonite::Sts
private alias Core = Amazonite::Core

module Amazonite::Sts
  class GetWebIdentityTokenRequest
    # The intended recipient of the web identity token. This value populates the `aud` claim in the
    # JWT and should identify the service or application that will validate and use the token. The
    # external service should verify this claim to ensure the token was intended for their use.
    property audience : Array(String) = [] of String

    # The duration, in seconds, for which the JSON Web Token (JWT) will remain valid. The value can
    # range from 60 seconds (1 minute) to 3600 seconds (1 hour). If not specified, the default
    # duration is 300 seconds (5 minutes). The token is designed to be short-lived and should be used
    # for proof of identity, then exchanged for credentials or short-lived tokens in the external
    # service.
    property duration_seconds : Int32 | Nil

    # The cryptographic algorithm to use for signing the JSON Web Token (JWT). Valid values are RS256
    # (RSA with SHA-256) and ES384 (ECDSA using P-384 curve with SHA-384).
    property signing_algorithm : String

    # One or more OAuth 2.0 scope values to include in the JSON Web Token (JWT). Amazon Web Services
    # STS copies the value exactly as you send it into the top-level `scope` claim of the token. If
    # you don't specify `Scope`, the token doesn't include a `scope` claim.
    #
    # Separate multiple values with a single space, as defined in [RFC 6749, section
    # 3.3](https://www.rfc-editor.org/rfc/rfc6749#section-3.3) on the IETF website. Don't begin or end
    # `Scope` with a space. Each scope value can contain printable ASCII characters except spaces,
    # double quotation marks (`"`), commas (`,`), and backslashes (`\`).
    #
    # You can't repeat a scope value. Scope values are case sensitive. This means that `read` and
    # `READ` are separate values.
    #
    # You can specify `Scope` only when `SubjectMode` is `OriginIdentity` and you request exactly one
    # audience. To specify `Scope`, the calling principal must have permission for the
    # `sts:SetWebIdentityTokenScope` action in addition to `sts:GetWebIdentityToken`. You can use the
    # multivalued `sts:IdentityTokenScope` condition key in a policy to control which scope values a
    # principal can request.
    property scope : String | Nil

    # Specifies which identity STS puts in the `sub` (subject) claim of the JSON Web Token (JWT).
    # Valid values are `AWSIdentity` and `OriginIdentity`. If you don't specify a value, Amazon Web
    # Services STS uses `AWSIdentity`.
    #
    # - `AWSIdentity` – The `sub` claim contains the ARN of the calling Amazon Web Services principal.
    #
    # - `OriginIdentity` – The `sub` claim contains the value of the `aws:OriginIdentity/Subject` key
    # in the trusted identity propagation context of the calling session. For example, this can
    # identify the human user or workload on whose behalf the calling session acts. Amazon Web
    # Services STS also adds a `subject_mode` claim to the token.
    #
    # To use `OriginIdentity`, the trusted identity propagation context of the calling session must
    # contain the `aws:OriginIdentity/Subject` key and either the `aws:OriginIdentity/Issuer` key or
    # the `aws:OriginIdentity/FederatedProviderArn` key. If it doesn't, or if the subject is blank,
    # Amazon Web Services STS rejects the request with a validation error.
    #
    # Amazon Web Services STS denies the request if the subject begins with the text `arn:`, in any
    # combination of uppercase and lowercase letters. Amazon Web Services STS also denies the request
    # if the subject begins or ends with a space, or contains a control, format, or separator
    # character other than a space.
    #
    # You can use the `sts:SubjectMode` condition key in a policy to control which subject modes a
    # principal can request.
    property subject_mode : WebIdentityTokenSubjectModeType | Nil

    # An optional list of tags to include in the JSON Web Token (JWT). These tags are added as custom
    # claims to the JWT and can be used by the downstream service for authorization decisions.
    property tags : Array(Tag) | Nil

    def initialize(
      @audience : Array(String),
      @signing_algorithm : String,
      @duration_seconds : Int32 | Nil = nil,
      @scope : String | Nil = nil,
      @subject_mode : WebIdentityTokenSubjectModeType | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @audience.each_with_index(1) do |item, i|
        params << {"#{prefix}Audience.member.#{i}", item}
      end

      if value = @duration_seconds
        params << {"#{prefix}DurationSeconds", value.to_s}
      end

      params << {"#{prefix}SigningAlgorithm", @signing_algorithm}

      if value = @scope
        params << {"#{prefix}Scope", value}
      end

      if value = @subject_mode
        params << {"#{prefix}SubjectMode", value.to_json_object_key}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        audience: node.xpath_nodes("*[local-name()='Audience']/*[local-name()='member']").map { |n| n.content },
        duration_seconds: Core::XMLValue.i32(node.xpath_node("*[local-name()='DurationSeconds']")),
        signing_algorithm: Core::XMLValue.string(node.xpath_node("*[local-name()='SigningAlgorithm']")).not_nil!,
        scope: Core::XMLValue.string(node.xpath_node("*[local-name()='Scope']")),
        subject_mode: (n = node.xpath_node("*[local-name()='SubjectMode']")) ? AS::WebIdentityTokenSubjectModeType.from_json_object_key?(n.content) : nil,
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @audience
        raise Core::ValidationError.new("Audience must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Audience must have at most 10 item(s)") if value.size > 10
      end

      if value = @duration_seconds
        raise Core::ValidationError.new("DurationSeconds value must be >= 60") if value < 60
        raise Core::ValidationError.new("DurationSeconds value must be <= 3600") if value > 3600
      end

      if value = @signing_algorithm
        raise Core::ValidationError.new("SigningAlgorithm length must be >= 5") if value.size < 5
        raise Core::ValidationError.new("SigningAlgorithm length must be <= 5") if value.size > 5
      end

      if value = @scope
        raise Core::ValidationError.new("Scope length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Scope length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("Scope does not match the required pattern") unless value.matches?(Regex.new("^[\\x21\\x23-\\x2B\\x2D-\\x5B\\x5D-\\x7E]+( [\\x21\\x23-\\x2B\\x2D-\\x5B\\x5D-\\x7E]+)*$"))
      end

      if value = @tags
        raise Core::ValidationError.new("Tags must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Tags must have at most 50 item(s)") if value.size > 50
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@audience, @duration_seconds, @signing_algorithm, @scope, @subject_mode, @tags)
  end
end
