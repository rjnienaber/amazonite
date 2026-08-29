private alias Core = Amazonite::Core

module Amazonite::IamV1
  class ListAttachedUserPoliciesRequest
    property user_name : String

    property path_prefix : String | Nil

    property marker : String | Nil

    property max_items : Int32 | Nil

    def initialize(
      @user_name : String,
      @path_prefix : String | Nil = nil,
      @marker : String | Nil = nil,
      @max_items : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}UserName", @user_name}

      if value = @path_prefix
        params << {"#{prefix}PathPrefix", value}
      end

      if value = @marker
        params << {"#{prefix}Marker", value}
      end

      if value = @max_items
        params << {"#{prefix}MaxItems", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")).not_nil!,
        path_prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='PathPrefix']")),
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
        max_items: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxItems']")),
      )
    end
  end
end
