private alias Core = Amazonite::Core

module Amazonite::Sts
  class GetScopedCredentialsRequest
    # An IAM policy in JSON format that you want to use as a scope down policy.
    #
    # A request must provide at least one of `Policy` or `DurationSeconds`. Both parameters are
    # optional individually, but you must specify at least one of them.
    #
    # The resulting session's permissions are the intersection of the calling session's existing
    # permissions and this scope down policy. You cannot use this scope down policy to grant more
    # permissions than the calling session already has.
    #
    # The plaintext of the scope down policy cannot exceed 2,048 characters. The JSON policy
    # characters can be any ASCII character from the space character to the end of the valid character
    # list (\u0020 through \u00FF). It can also include the tab (\u0009), linefeed (\u000A), and
    # carriage return (\u000D) characters.
    #
    # An internal conversion compresses the inline scope down policy into a packed binary format that
    # has a separate limit. If the packed policy exceeds this limit, the request fails with
    # `PackedPolicyTooLarge`.
    #
    # If the document is not valid IAM policy JSON, the request fails with `MalformedPolicyDocument`.
    property policy : String | Nil

    # The duration, in seconds, of the resulting scoped down credentials. The value can range from 1
    # second to 129,600 seconds (36 hours).
    #
    # If you do not specify this value, the scoped down credentials will inherit the calling session's
    # expiration time.
    property duration_seconds : Int32 | Nil

    property minimum_session_token_size : Int32 | Nil

    # A caller-supplied description of the scoped session. The value cannot exceed 256 characters.
    # This description is logged to CloudTrail for the request, so you can use it to record the
    # purpose of the scoped session.
    property scoped_session_description : String | Nil

    def initialize(
      @policy : String | Nil = nil,
      @duration_seconds : Int32 | Nil = nil,
      @minimum_session_token_size : Int32 | Nil = nil,
      @scoped_session_description : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @policy
        params << {"#{prefix}Policy", value}
      end

      if value = @duration_seconds
        params << {"#{prefix}DurationSeconds", value.to_s}
      end

      if value = @minimum_session_token_size
        params << {"#{prefix}MinimumSessionTokenSize", value.to_s}
      end

      if value = @scoped_session_description
        params << {"#{prefix}ScopedSessionDescription", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy: Core::XMLValue.string(node.xpath_node("*[local-name()='Policy']")),
        duration_seconds: Core::XMLValue.i32(node.xpath_node("*[local-name()='DurationSeconds']")),
        minimum_session_token_size: Core::XMLValue.i32(node.xpath_node("*[local-name()='MinimumSessionTokenSize']")),
        scoped_session_description: Core::XMLValue.string(node.xpath_node("*[local-name()='ScopedSessionDescription']")),
      )
    end

    def validate! : Nil
      if value = @policy
        raise Core::ValidationError.new("Policy length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Policy length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("Policy does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -ÿ]+$"))
      end

      if value = @duration_seconds
        raise Core::ValidationError.new("DurationSeconds value must be >= 1") if value < 1
        raise Core::ValidationError.new("DurationSeconds value must be <= 129600") if value > 129600
      end

      if value = @minimum_session_token_size
        raise Core::ValidationError.new("MinimumSessionTokenSize value must be >= 0") if value < 0
        raise Core::ValidationError.new("MinimumSessionTokenSize value must be <= 4096") if value > 4096
      end

      if value = @scoped_session_description
        raise Core::ValidationError.new("ScopedSessionDescription length must be >= 2") if value.size < 2
        raise Core::ValidationError.new("ScopedSessionDescription length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("ScopedSessionDescription does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -~¡-ÿ]*$"))
      end
    end

    def_equals_and_hash(@policy, @duration_seconds, @minimum_session_token_size, @scoped_session_description)
  end
end
