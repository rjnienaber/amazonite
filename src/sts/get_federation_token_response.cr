private alias Core = Amazonite::Core

module Amazonite::Sts
  # Contains the response to a successful GetFederationToken request, including temporary Amazon Web
  # Services credentials that can be used to make Amazon Web Services requests.
  class GetFederationTokenResponse
    # The temporary security credentials, which include an access key ID, a secret access key, and a
    # security (or session) token.
    #
    # The size of the security token that STS API operations return is not fixed. We strongly
    # recommend that you make no assumptions about the maximum size.
    property credentials : Credentials | Nil

    # Identifiers for the federated user associated with the credentials (such as
    # `arn:aws:sts::123456789012:federated-user/Bob` or `123456789012:Bob`). You can use the federated
    # user's ARN in your resource-based policies, such as an Amazon S3 bucket policy.
    property federated_user : FederatedUser | Nil

    # A percentage value that indicates the packed size of the session policies and session tags
    # combined passed in the request. The request fails if the packed size is greater than 100
    # percent, which means the policies and tags exceeded the allowed space.
    property packed_policy_size : Int32 | Nil

    def initialize(
      @credentials : Credentials | Nil = nil,
      @federated_user : FederatedUser | Nil = nil,
      @packed_policy_size : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @credentials
        params.concat(value.to_query_params("#{prefix}Credentials."))
      end

      if value = @federated_user
        params.concat(value.to_query_params("#{prefix}FederatedUser."))
      end

      if value = @packed_policy_size
        params << {"#{prefix}PackedPolicySize", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        credentials: node.xpath_node("*[local-name()='Credentials']").try { |n| Credentials.from_xml(n) },
        federated_user: node.xpath_node("*[local-name()='FederatedUser']").try { |n| FederatedUser.from_xml(n) },
        packed_policy_size: Core::XMLValue.i32(node.xpath_node("*[local-name()='PackedPolicySize']")),
      )
    end

    def validate! : Nil
      if value = @credentials
        value.validate!
      end

      if value = @federated_user
        value.validate!
      end

      if value = @packed_policy_size
        raise Core::ValidationError.new("PackedPolicySize value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@credentials, @federated_user, @packed_policy_size)
  end
end
