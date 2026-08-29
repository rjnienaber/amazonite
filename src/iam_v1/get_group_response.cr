private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetGroupResponse
    property group : Group

    property users : Array(User) = [] of User

    property is_truncated : Bool | Nil

    property marker : String | Nil

    def initialize(
      @group : Group,
      @users : Array(User),
      @is_truncated : Bool | Nil = nil,
      @marker : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params.concat(@group.to_query_params("#{prefix}Group."))

      @users.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Users.member.#{i}."))
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
        group: node.xpath_node("*[local-name()='Group']").try { |n| Group.from_xml(n) }.not_nil!,
        users: node.xpath_nodes("*[local-name()='Users']/*[local-name()='member']").map { |n| User.from_xml(n) },
        is_truncated: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsTruncated']")),
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
      )
    end
  end
end
