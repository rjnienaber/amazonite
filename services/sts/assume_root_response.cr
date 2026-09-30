private alias Core = Amazonite::Core

module Amazonite::Sts
  class AssumeRootResponse
    # The temporary security credentials, which include an access key ID, a secret access key, and a
    # security token.
    #
    # The size of the security token that STS API operations return is not fixed. We strongly
    # recommend that you make no assumptions about the maximum size.
    property credentials : Credentials | Nil

    # The source identity specified by the principal that is calling the `AssumeRoot` operation.
    #
    # You can use the `aws:SourceIdentity` condition key to control access based on the value of
    # source identity. For more information about using source identity, see [Monitor and control
    # actions taken with assumed
    # roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_control-access_monitor.html)
    # in the *IAM User Guide*.
    #
    # The regex used to validate this parameter is a string of characters consisting of upper- and
    # lower-case alphanumeric characters with no spaces. You can also include underscores or any of
    # the following characters: =,.@-
    property source_identity : String | Nil

    property session_token_utilization : Int32 | Nil

    property session_token_size : Int32 | Nil

    def initialize(
      @credentials : Credentials | Nil = nil,
      @source_identity : String | Nil = nil,
      @session_token_utilization : Int32 | Nil = nil,
      @session_token_size : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @credentials
        params.concat(value.to_query_params("#{prefix}Credentials."))
      end

      if value = @source_identity
        params << {"#{prefix}SourceIdentity", value}
      end

      if value = @session_token_utilization
        params << {"#{prefix}SessionTokenUtilization", value.to_s}
      end

      if value = @session_token_size
        params << {"#{prefix}SessionTokenSize", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        credentials: node.xpath_node("*[local-name()='Credentials']").try { |n| Credentials.from_xml(n) },
        source_identity: Core::XMLValue.string(node.xpath_node("*[local-name()='SourceIdentity']")),
        session_token_utilization: Core::XMLValue.i32(node.xpath_node("*[local-name()='SessionTokenUtilization']")),
        session_token_size: Core::XMLValue.i32(node.xpath_node("*[local-name()='SessionTokenSize']")),
      )
    end

    def validate! : Nil
      if value = @credentials
        value.validate!
      end

      if value = @source_identity
        raise Core::ValidationError.new("SourceIdentity length must be >= 2") if value.size < 2
        raise Core::ValidationError.new("SourceIdentity length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("SourceIdentity does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]*$"))
      end

      if value = @session_token_utilization
        raise Core::ValidationError.new("SessionTokenUtilization value must be >= 0") if value < 0
      end

      if value = @session_token_size
        raise Core::ValidationError.new("SessionTokenSize value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@credentials, @source_identity, @session_token_utilization, @session_token_size)
  end
end
