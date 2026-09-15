private alias Core = Amazonite::Core

module Amazonite::Sts
  # Contains the response to a successful GetSessionToken request, including temporary Amazon Web
  # Services credentials that can be used to make Amazon Web Services requests.
  class GetSessionTokenResponse
    # The temporary security credentials, which include an access key ID, a secret access key, and a
    # security (or session) token.
    #
    # The size of the security token that STS API operations return is not fixed. We strongly
    # recommend that you make no assumptions about the maximum size.
    property credentials : Credentials | Nil

    property session_token_utilization : Int32 | Nil

    property session_token_size : Int32 | Nil

    def initialize(
      @credentials : Credentials | Nil = nil,
      @session_token_utilization : Int32 | Nil = nil,
      @session_token_size : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @credentials
        params.concat(value.to_query_params("#{prefix}Credentials."))
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
        session_token_utilization: Core::XMLValue.i32(node.xpath_node("*[local-name()='SessionTokenUtilization']")),
        session_token_size: Core::XMLValue.i32(node.xpath_node("*[local-name()='SessionTokenSize']")),
      )
    end

    def validate! : Nil
      if value = @credentials
        value.validate!
      end

      if value = @session_token_utilization
        raise Core::ValidationError.new("SessionTokenUtilization value must be >= 0") if value < 0
      end

      if value = @session_token_size
        raise Core::ValidationError.new("SessionTokenSize value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@credentials, @session_token_utilization, @session_token_size)
  end
end
