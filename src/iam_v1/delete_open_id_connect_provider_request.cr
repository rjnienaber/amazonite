private alias Core = Amazonite::Core

module Amazonite::IamV1
  class DeleteOpenIDConnectProviderRequest
    # The Amazon Resource Name (ARN) of the IAM OpenID Connect provider resource object to delete. You
    # can get a list of OpenID Connect provider resource ARNs by using the
    # [ListOpenIDConnectProviders](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListOpenIDConnectProviders.html)
    # operation.
    property open_id_connect_provider_arn : String

    def initialize(
      @open_id_connect_provider_arn : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}OpenIDConnectProviderArn", @open_id_connect_provider_arn}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        open_id_connect_provider_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='OpenIDConnectProviderArn']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @open_id_connect_provider_arn
        raise Core::ValidationError.new("OpenIDConnectProviderArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("OpenIDConnectProviderArn length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@open_id_connect_provider_arn)
  end
end
