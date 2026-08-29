private alias Core = Amazonite::Core

module Amazonite::IamV1
  class ListAccountAliasesResponse
    property account_aliases : Array(String) = [] of String

    property is_truncated : Bool | Nil

    property marker : String | Nil

    def initialize(
      @account_aliases : Array(String),
      @is_truncated : Bool | Nil = nil,
      @marker : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @account_aliases.each_with_index(1) do |item, i|
        params << {"#{prefix}AccountAliases.member.#{i}", item}
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
        account_aliases: node.xpath_nodes("*[local-name()='AccountAliases']/*[local-name()='member']").map { |n| n.content },
        is_truncated: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsTruncated']")),
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
      )
    end
  end
end
