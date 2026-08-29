private alias Core = Amazonite::Core

module Amazonite::IamV1
  class CreateLoginProfileRequest
    property user_name : String | Nil

    property password : String | Nil

    property password_reset_required : Bool | Nil

    def initialize(
      @user_name : String | Nil = nil,
      @password : String | Nil = nil,
      @password_reset_required : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @user_name
        params << {"#{prefix}UserName", value}
      end

      if value = @password
        params << {"#{prefix}Password", value}
      end

      if value = @password_reset_required
        params << {"#{prefix}PasswordResetRequired", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")),
        password: Core::XMLValue.string(node.xpath_node("*[local-name()='Password']")),
        password_reset_required: Core::XMLValue.bool(node.xpath_node("*[local-name()='PasswordResetRequired']")),
      )
    end
  end
end
