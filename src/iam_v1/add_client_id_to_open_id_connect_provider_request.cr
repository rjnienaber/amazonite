private alias Core = Amazonite::Core

module Amazonite::IamV1
  class AddClientIDToOpenIDConnectProviderRequest
    # The Amazon Resource Name (ARN) of the IAM OpenID Connect (OIDC) provider resource to add the
    # client ID to. You can get a list of OIDC provider ARNs by using the
    # [ListOpenIDConnectProviders](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListOpenIDConnectProviders.html)
    # operation.
    property open_id_connect_provider_arn : String

    # The client ID (also known as audience) to add to the IAM OpenID Connect provider resource.
    property client_id : String

    def initialize(
      @open_id_connect_provider_arn : String,
      @client_id : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}OpenIDConnectProviderArn", @open_id_connect_provider_arn}

      params << {"#{prefix}ClientID", @client_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        open_id_connect_provider_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='OpenIDConnectProviderArn']")).not_nil!,
        client_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientID']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @open_id_connect_provider_arn
        raise Core::ValidationError.new("OpenIDConnectProviderArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("OpenIDConnectProviderArn length must be <= 2048") if value.size > 2048
      end

      if value = @client_id
        raise Core::ValidationError.new("ClientID length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ClientID length must be <= 255") if value.size > 255
      end
    end

    def_equals_and_hash(@open_id_connect_provider_arn, @client_id)
  end
end
