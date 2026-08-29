private alias Core = Amazonite::Core

module Amazonite::IamV1
  class PolicyUser
    property user_name : String | Nil

    property user_id : String | Nil

    def initialize(
      @user_name : String | Nil = nil,
      @user_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @user_name
        params << {"#{prefix}UserName", value}
      end

      if value = @user_id
        params << {"#{prefix}UserId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")),
        user_id: Core::XMLValue.string(node.xpath_node("*[local-name()='UserId']")),
      )
    end
  end
end
