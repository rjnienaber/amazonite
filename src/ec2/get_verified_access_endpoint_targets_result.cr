private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetVerifiedAccessEndpointTargetsResult
    # The Verified Access targets.
    property verified_access_endpoint_targets : Array(VerifiedAccessEndpointTarget) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @verified_access_endpoint_targets : Array(VerifiedAccessEndpointTarget) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@verified_access_endpoint_targets || [] of VerifiedAccessEndpointTarget).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}VerifiedAccessEndpointTargetSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        verified_access_endpoint_targets: node.xpath_nodes("*[local-name()='verifiedAccessEndpointTargetSet']/*[local-name()='item']").map { |n| VerifiedAccessEndpointTarget.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @verified_access_endpoint_targets
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@verified_access_endpoint_targets, @next_token)
  end
end
