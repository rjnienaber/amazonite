private alias Core = Amazonite::Core

module Amazonite::StsV1
  # Contains the response to a successful GetSessionToken request, including temporary Amazon Web
  # Services credentials that can be used to make Amazon Web Services requests.
  class GetSessionTokenResponse
    # The temporary security credentials, which include an access key ID, a secret access key, and a
    # security (or session) token.
    #
    # The size of the security token that STS API operations return is not fixed. We strongly
    # recommend that you make no assumptions about the maximum size.
    property credentials : Credentials | Nil

    def initialize(
      @credentials : Credentials | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @credentials
        params.concat(value.to_query_params("#{prefix}Credentials."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        credentials: node.xpath_node("*[local-name()='Credentials']").try { |n| Credentials.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @credentials
        value.validate!
      end
    end

    def_equals_and_hash(@credentials)
  end
end
