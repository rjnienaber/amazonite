private alias Core = Amazonite::Core

module Amazonite::IamV1
  class UpdateLoginProfileRequest
    # The name of the user whose password you want to update.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property user_name : String

    # The new password for the specified IAM user.
    #
    # The [regex pattern](http://wikipedia.org/wiki/regex) used to validate this parameter is a string
    # of characters consisting of the following:
    #
    # - Any printable ASCII character ranging from the space character (`\u0020`) through the end of
    # the ASCII character range
    #
    # - The printable characters in the Basic Latin and Latin-1 Supplement character set (through
    # `\u00FF`)
    #
    # - The special characters tab (`\u0009`), line feed (`\u000A`), and carriage return (`\u000D`)
    #
    # However, the format can be further restricted by the account administrator by setting a password
    # policy on the Amazon Web Services account. For more information, see
    # [UpdateAccountPasswordPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_UpdateAccountPasswordPolicy.html).
    property password : String | Nil

    # Allows this new password to be used only once by requiring the specified IAM user to set a new
    # password on next sign-in.
    property password_reset_required : Bool | Nil

    def initialize(
      @user_name : String,
      @password : String | Nil = nil,
      @password_reset_required : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}UserName", @user_name}

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
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")).not_nil!,
        password: Core::XMLValue.string(node.xpath_node("*[local-name()='Password']")),
        password_reset_required: Core::XMLValue.bool(node.xpath_node("*[local-name()='PasswordResetRequired']")),
      )
    end
  end
end
