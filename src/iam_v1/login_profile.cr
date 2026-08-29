private alias Core = Amazonite::Core

module Amazonite::IamV1
  class LoginProfile
    property user_name : String

    property create_date : Time

    property password_reset_required : Bool | Nil

    def initialize(
      @user_name : String,
      @create_date : Time,
      @password_reset_required : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}UserName", @user_name}

      params << {"#{prefix}CreateDate", Core::QueryValue.time(@create_date)}

      if value = @password_reset_required
        params << {"#{prefix}PasswordResetRequired", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")).not_nil!,
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='CreateDate']")).not_nil!,
        password_reset_required: Core::XMLValue.bool(node.xpath_node("*[local-name()='PasswordResetRequired']")),
      )
    end
  end
end
