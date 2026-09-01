private alias Core = Amazonite::Core

module Amazonite::Iam
  class ListDelegationRequestsResponse
    # A list of delegation requests that match the specified criteria.
    property delegation_requests : Array(DelegationRequest) | Nil

    # When `isTruncated` is `true`, this element is present and contains the value to use for the
    # `Marker` parameter in a subsequent pagination request.
    property marker : String | Nil

    # A flag that indicates whether there are more items to return. If your results were truncated,
    # you can make a subsequent pagination request using the `Marker` request parameter to retrieve
    # more items.
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

    def validate! : Nil
      if value = @delegation_requests
        value.each(&.validate!)
      end

      if value = @marker
        raise Core::ValidationError.new("Marker length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Marker length must be <= 320") if value.size > 320
        raise Core::ValidationError.new("Marker does not match the required pattern") unless value.matches?(Regex.new("^[ -ÿ]+$"))
      end
    end

    def_equals_and_hash(@delegation_requests, @marker, @is_truncated)
  end
end
