private alias Core = Amazonite::Core

module Amazonite::IamV1
  class ListPoliciesGrantingServiceAccessResponse
    property policies_granting_service_access : Array(ListPoliciesGrantingServiceAccessEntry) = [] of ListPoliciesGrantingServiceAccessEntry

    property is_truncated : Bool | Nil

    property marker : String | Nil

    def initialize(
      @policies_granting_service_access : Array(ListPoliciesGrantingServiceAccessEntry),
      @is_truncated : Bool | Nil = nil,
      @marker : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @policies_granting_service_access.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PoliciesGrantingServiceAccess.member.#{i}."))
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
        policies_granting_service_access: node.xpath_nodes("*[local-name()='PoliciesGrantingServiceAccess']/*[local-name()='member']").map { |n| ListPoliciesGrantingServiceAccessEntry.from_xml(n) },
        is_truncated: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsTruncated']")),
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
      )
    end
  end
end
