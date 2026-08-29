private alias Core = Amazonite::Core

module Amazonite::IamV1
  class UpdateUserRequest
    property user_name : String

    property new_path : String | Nil

    property new_user_name : String | Nil

    def initialize(
      @user_name : String,
      @new_path : String | Nil = nil,
      @new_user_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}UserName", @user_name}

      if value = @new_path
        params << {"#{prefix}NewPath", value}
      end

      if value = @new_user_name
        params << {"#{prefix}NewUserName", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")).not_nil!,
        new_path: Core::XMLValue.string(node.xpath_node("*[local-name()='NewPath']")),
        new_user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='NewUserName']")),
      )
    end
  end
end
