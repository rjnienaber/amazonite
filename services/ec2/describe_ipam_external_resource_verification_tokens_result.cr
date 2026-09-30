private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeIpamExternalResourceVerificationTokensResult
    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    # Verification tokens.
    property ipam_external_resource_verification_tokens : Array(IpamExternalResourceVerificationToken) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @ipam_external_resource_verification_tokens : Array(IpamExternalResourceVerificationToken) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@ipam_external_resource_verification_tokens || [] of IpamExternalResourceVerificationToken).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}IpamExternalResourceVerificationTokenSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        ipam_external_resource_verification_tokens: node.xpath_nodes("*[local-name()='ipamExternalResourceVerificationTokenSet']/*[local-name()='item']").map { |n| IpamExternalResourceVerificationToken.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ipam_external_resource_verification_tokens
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @ipam_external_resource_verification_tokens)
  end
end
