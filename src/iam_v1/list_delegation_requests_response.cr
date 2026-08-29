private alias Core = Amazonite::Core

module Amazonite::IamV1
  class ListDelegationRequestsResponse
    property delegation_requests : Array(DelegationRequest) | Nil

    property marker : String | Nil

    property is_truncated : Bool | Nil

    def initialize(
      @delegation_requests : Array(DelegationRequest) | Nil = nil,
      @marker : String | Nil = nil,
      @is_truncated : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@delegation_requests || [] of DelegationRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}DelegationRequests.member.#{i}."))
      end

      if value = @marker
        params << {"#{prefix}Marker", value}
      end

      if value = @is_truncated
        params << {"#{prefix}isTruncated", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        delegation_requests: node.xpath_nodes("*[local-name()='DelegationRequests']/*[local-name()='member']").map { |n| DelegationRequest.from_xml(n) },
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
        is_truncated: Core::XMLValue.bool(node.xpath_node("*[local-name()='isTruncated']")),
      )
    end
  end
end
