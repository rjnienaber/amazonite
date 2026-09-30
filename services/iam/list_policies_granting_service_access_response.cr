private alias Core = Amazonite::Core

module Amazonite::Iam
  class ListPoliciesGrantingServiceAccessResponse
    # A `ListPoliciesGrantingServiceAccess` object that contains details about the permissions
    # policies attached to the specified identity (user, group, or role).
    property policies_granting_service_access : Array(ListPoliciesGrantingServiceAccessEntry) = [] of ListPoliciesGrantingServiceAccessEntry

    # A flag that indicates whether there are more items to return. If your results were truncated,
    # you can make a subsequent pagination request using the `Marker` request parameter to retrieve
    # more items. We recommend that you check `IsTruncated` after every call to ensure that you
    # receive all your results.
    property is_truncated : Bool | Nil

    # When `IsTruncated` is `true`, this element is present and contains the value to use for the
    # `Marker` parameter in a subsequent pagination request.
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

    def validate! : Nil
      if value = @policies_granting_service_access
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@policies_granting_service_access, @is_truncated, @marker)
  end
end
