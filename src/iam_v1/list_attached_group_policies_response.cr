private alias Core = Amazonite::Core

module Amazonite::IamV1
  class ListAttachedGroupPoliciesResponse
    property attached_policies : Array(AttachedPolicy) | Nil

    property is_truncated : Bool | Nil

    property marker : String | Nil

    def initialize(
      @attached_policies : Array(AttachedPolicy) | Nil = nil,
      @is_truncated : Bool | Nil = nil,
      @marker : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@attached_policies || [] of AttachedPolicy).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AttachedPolicies.member.#{i}."))
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
        attached_policies: node.xpath_nodes("*[local-name()='AttachedPolicies']/*[local-name()='member']").map { |n| AttachedPolicy.from_xml(n) },
        is_truncated: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsTruncated']")),
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
      )
    end
  end
end
