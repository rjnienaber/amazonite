private alias Core = Amazonite::Core

module Amazonite::IamV1
  class UpdateOpenIDConnectProviderThumbprintRequest
    # The Amazon Resource Name (ARN) of the IAM OIDC provider resource object for which you want to
    # update the thumbprint. You can get a list of OIDC provider ARNs by using the
    # [ListOpenIDConnectProviders](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListOpenIDConnectProviders.html)
    # operation.
    #
    # For more information about ARNs, see [Amazon Resource Names
    # (ARNs)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) in the
    # *Amazon Web Services General Reference*.
    property open_id_connect_provider_arn : String

    # A list of certificate thumbprints that are associated with the specified IAM OpenID Connect
    # provider. For more information, see
    # [CreateOpenIDConnectProvider](https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateOpenIDConnectProvider.html).
    property thumbprint_list : Array(String) = [] of String

    def initialize(
      @open_id_connect_provider_arn : String,
      @thumbprint_list : Array(String),
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}OpenIDConnectProviderArn", @open_id_connect_provider_arn}

      @thumbprint_list.each_with_index(1) do |item, i|
        params << {"#{prefix}ThumbprintList.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        open_id_connect_provider_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='OpenIDConnectProviderArn']")).not_nil!,
        thumbprint_list: node.xpath_nodes("*[local-name()='ThumbprintList']/*[local-name()='member']").map { |n| n.content },
      )
    end
  end
end
