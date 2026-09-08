private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeVerifiedAccessTrustProvidersResult
    # Details about the Verified Access trust providers.
    property verified_access_trust_providers : Array(VerifiedAccessTrustProvider) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @verified_access_trust_providers : Array(VerifiedAccessTrustProvider) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@verified_access_trust_providers || [] of VerifiedAccessTrustProvider).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}VerifiedAccessTrustProviderSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        verified_access_trust_providers: node.xpath_nodes("*[local-name()='verifiedAccessTrustProviderSet']/*[local-name()='item']").map { |n| VerifiedAccessTrustProvider.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @verified_access_trust_providers
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@verified_access_trust_providers, @next_token)
  end
end
