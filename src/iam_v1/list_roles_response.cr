private alias Core = Amazonite::Core

module Amazonite::IamV1
  class ListRolesResponse
    property roles : Array(Role) = [] of Role

    property is_truncated : Bool | Nil

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
  end
end
