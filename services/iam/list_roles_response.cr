private alias Core = Amazonite::Core

module Amazonite::Iam
  # Contains the response to a successful
  # [ListRoles](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListRoles.html) request.
  class ListRolesResponse
    # A list of roles.
    property roles : Array(Role) = [] of Role

    # A flag that indicates whether there are more items to return. If your results were truncated,
    # you can make a subsequent pagination request using the `Marker` request parameter to retrieve
    # more items. Note that IAM might return fewer than the `MaxItems` number of results even when
    # there are more results available. We recommend that you check `IsTruncated` after every call to
    # ensure that you receive all your results.
    property is_truncated : Bool | Nil

    # When `IsTruncated` is `true`, this element is present and contains the value to use for the
    # `Marker` parameter in a subsequent pagination request.
    property marker : String | Nil

    def initialize(
      @roles : Array(Role),
      @is_truncated : Bool | Nil = nil,
      @marker : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @roles.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Roles.member.#{i}."))
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
        roles: node.xpath_nodes("*[local-name()='Roles']/*[local-name()='member']").map { |n| Role.from_xml(n) },
        is_truncated: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsTruncated']")),
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
      )
    end

    def validate! : Nil
      if value = @roles
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@roles, @is_truncated, @marker)
  end
end
