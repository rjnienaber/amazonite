private alias Core = Amazonite::Core

module Amazonite::IamV1
  class ListServiceSpecificCredentialsRequest
    property user_name : String | Nil

    property service_name : String | Nil

    property all_users : Bool | Nil

    property marker : String | Nil

    property max_items : Int32 | Nil

    def initialize(
      @user_name : String | Nil = nil,
      @service_name : String | Nil = nil,
      @all_users : Bool | Nil = nil,
      @marker : String | Nil = nil,
      @max_items : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @user_name
        params << {"#{prefix}UserName", value}
      end

      if value = @service_name
        params << {"#{prefix}ServiceName", value}
      end

      if value = @all_users
        params << {"#{prefix}AllUsers", Core::QueryValue.bool(value)}
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
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")),
        service_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceName']")),
        all_users: Core::XMLValue.bool(node.xpath_node("*[local-name()='AllUsers']")),
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
        max_items: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxItems']")),
      )
    end
  end
end
