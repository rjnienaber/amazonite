private alias Core = Amazonite::Core

module Amazonite::IamV1
  class CreateLoginProfileRequest
    # The name of the IAM user to create a password for. The user must already exist.
    #
    # This parameter is optional. If no user name is included, it defaults to the principal making the
    # request. When you make this request with root user credentials, you must use an
    # [AssumeRoot](https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRoot.html) session to
    # omit the user name.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property user_name : String | Nil

    # The new password for the user.
    #
    # This parameter must be omitted when you make the request with an
    # [AssumeRoot](https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRoot.html) session.
    # It is required in all other cases.
    #
    # The [regex pattern](http://wikipedia.org/wiki/regex) that is used to validate this parameter is
    # a string of characters. That string can include almost any printable ASCII character from the
    # space (`\u0020`) through the end of the ASCII character range (`\u00FF`). You can also include
    # the tab (`\u0009`), line feed (`\u000A`), and carriage return (`\u000D`) characters. Any of
    # these characters are valid in a password. However, many tools, such as the Amazon Web Services
    # Management Console, might restrict the ability to type certain characters because they have
    # special meaning within that tool.
    property password : String | Nil

    # Specifies whether the user is required to set a new password on next sign-in.
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
