private alias Core = Amazonite::Core

module Amazonite::Iam
  # Contains the response to a successful
  # [ListOpenIDConnectProviders](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListOpenIDConnectProviders.html)
  # request.
  class ListOpenIDConnectProvidersResponse
    # The list of IAM OIDC provider resource objects defined in the Amazon Web Services account.
    property open_id_connect_provider_list : Array(OpenIDConnectProviderListEntry) | Nil

    def initialize(
      @open_id_connect_provider_list : Array(OpenIDConnectProviderListEntry) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@open_id_connect_provider_list || [] of OpenIDConnectProviderListEntry).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}OpenIDConnectProviderList.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        open_id_connect_provider_list: node.xpath_nodes("*[local-name()='OpenIDConnectProviderList']/*[local-name()='member']").map { |n| OpenIDConnectProviderListEntry.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @open_id_connect_provider_list
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@open_id_connect_provider_list)
  end
end
