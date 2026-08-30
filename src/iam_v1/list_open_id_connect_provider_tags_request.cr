private alias Core = Amazonite::Core

module Amazonite::IamV1
  class ListOpenIDConnectProviderTagsRequest
    # The ARN of the OpenID Connect (OIDC) identity provider whose tags you want to see.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property open_id_connect_provider_arn : String

    # Use this parameter only when paginating results and only after you receive a response indicating
    # that the results are truncated. Set it to the value of the `Marker` element in the response that
    # you received to indicate where the next call should start.
    property marker : String | Nil

    # Use this only when paginating results to indicate the maximum number of items you want in the
    # response. If additional items exist beyond the maximum you specify, the `IsTruncated` response
    # element is `true`.
    #
    # If you do not include this parameter, the number of items defaults to 100. Note that IAM might
    # return fewer results, even when there are more results available. In that case, the
    # `IsTruncated` response element returns `true`, and `Marker` contains a value to include in the
    # subsequent call that tells the service where to continue from.
    property max_items : Int32 | Nil

    def initialize(
      @open_id_connect_provider_arn : String,
      @marker : String | Nil = nil,
      @max_items : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}OpenIDConnectProviderArn", @open_id_connect_provider_arn}

      if value = @marker
        params << {"#{prefix}Marker", value}
      end

      if value = @max_items
        params << {"#{prefix}MaxItems", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        open_id_connect_provider_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='OpenIDConnectProviderArn']")).not_nil!,
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
        max_items: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxItems']")),
      )
    end

    def_equals_and_hash(@open_id_connect_provider_arn, @marker, @max_items)
  end
end
