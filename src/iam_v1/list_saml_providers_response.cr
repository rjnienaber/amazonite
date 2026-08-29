module Amazonite::IamV1
  # Contains the response to a successful
  # [ListSAMLProviders](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListSAMLProviders.html)
  # request.
  class ListSAMLProvidersResponse
    # The list of SAML provider resource objects defined in IAM for this Amazon Web Services account.
    property saml_provider_list : Array(SAMLProviderListEntry) | Nil

    def initialize(
      @saml_provider_list : Array(SAMLProviderListEntry) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@saml_provider_list || [] of SAMLProviderListEntry).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SAMLProviderList.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        saml_provider_list: node.xpath_nodes("*[local-name()='SAMLProviderList']/*[local-name()='member']").map { |n| SAMLProviderListEntry.from_xml(n) },
      )
    end
  end
end
