private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains the user name and password create date for a user.
  #
  # This data type is used as a response element in the
  # [CreateLoginProfile](https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateLoginProfile.html)
  # and
  # [GetLoginProfile](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetLoginProfile.html)
  # operations.
  class LoginProfile
    # The name of the user, which can be used for signing in to the Amazon Web Services Management
    # Console.
    property user_name : String

    # The date when the password for the user was created.
    property create_date : Time

    # Specifies whether the user is required to set a new password on next sign-in.
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

    def_equals_and_hash(@user_name, @create_date, @password_reset_required)
  end
end
