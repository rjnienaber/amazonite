private alias Core = Amazonite::Core

module Amazonite::IamV1
  class ListPoliciesResponse
    property policies : Array(Policy) | Nil

    property is_truncated : Bool | Nil

    property marker : String | Nil

    def initialize(
      @policies : Array(Policy) | Nil = nil,
      @is_truncated : Bool | Nil = nil,
      @marker : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@policies || [] of Policy).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Policies.member.#{i}."))
      end

      if value = @is_truncated
        params << {"#{prefix}IsTruncated", Core::QueryValue.bool(value)}
      end

      if value = @marker
        params << {"#{prefix}Marker", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policies: node.xpath_nodes("*[local-name()='Policies']/*[local-name()='member']").map { |n| Policy.from_xml(n) },
        is_truncated: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsTruncated']")),
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
      )
    end
  end
end
