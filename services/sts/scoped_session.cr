private alias Core = Amazonite::Core

module Amazonite::Sts
  # Identifiers for the scoped session that `GetScopedCredentials` returns. The underlying identity
  # and session name do not change from the caller principal.
  class ScopedSession
    # A unique identifier for the scoped session. Because the identity is preserved, this identifies
    # the same principal as the calling session.
    property scoped_session_id : String

    # The ARN of the scoped session. For more information about ARNs and how to use them in policies,
    # see [IAM
    # Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html) in the
    # *IAM User Guide*.
    property arn : String

    def initialize(
      @scoped_session_id : String,
      @arn : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ScopedSessionId", @scoped_session_id}

      params << {"#{prefix}Arn", @arn}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        scoped_session_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ScopedSessionId']")).not_nil!,
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @scoped_session_id
        raise Core::ValidationError.new("ScopedSessionId length must be >= 2") if value.size < 2
        raise Core::ValidationError.new("ScopedSessionId length must be <= 193") if value.size > 193
        raise Core::ValidationError.new("ScopedSessionId does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@:-]*$"))
      end

      if value = @arn
        raise Core::ValidationError.new("Arn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("Arn length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("Arn does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -~\u0085\u00A0-퟿\uE000-�က0-ჿFF]+$"))
      end
    end

    def_equals_and_hash(@scoped_session_id, @arn)
  end
end
