private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeVerifiedAccessEndpointsResult
    # Details about the Verified Access endpoints.
    property verified_access_endpoints : Array(VerifiedAccessEndpoint) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @verified_access_endpoints : Array(VerifiedAccessEndpoint) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@verified_access_endpoints || [] of VerifiedAccessEndpoint).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}VerifiedAccessEndpointSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        verified_access_endpoints: node.xpath_nodes("*[local-name()='verifiedAccessEndpointSet']/*[local-name()='item']").map { |n| VerifiedAccessEndpoint.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @verified_access_endpoints
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@verified_access_endpoints, @next_token)
  end
end
