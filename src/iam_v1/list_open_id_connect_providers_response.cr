module Amazonite::IamV1
  class ListOpenIDConnectProvidersResponse
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
  end
end
