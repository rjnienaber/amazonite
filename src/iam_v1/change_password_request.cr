private alias Core = Amazonite::Core

module Amazonite::IamV1
  class ChangePasswordRequest
    # The IAM user's current password.
    property old_password : String

    # The new password. The new password must conform to the Amazon Web Services account's password
    # policy, if one exists.
    #
    # The [regex pattern](http://wikipedia.org/wiki/regex) that is used to validate this parameter is
    # a string of characters. That string can include almost any printable ASCII character from the
    # space (`\u0020`) through the end of the ASCII character range (`\u00FF`). You can also include
    # the tab (`\u0009`), line feed (`\u000A`), and carriage return (`\u000D`) characters. Any of
    # these characters are valid in a password. However, many tools, such as the Amazon Web Services
    # Management Console, might restrict the ability to type certain characters because they have
    # special meaning within that tool.
    property new_password : String

    def initialize(
      @old_password : String,
      @new_password : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}OldPassword", @old_password}

      params << {"#{prefix}NewPassword", @new_password}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        old_password: Core::XMLValue.string(node.xpath_node("*[local-name()='OldPassword']")).not_nil!,
        new_password: Core::XMLValue.string(node.xpath_node("*[local-name()='NewPassword']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @old_password
        raise Core::ValidationError.new("OldPassword length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("OldPassword length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("OldPassword does not match the required pattern") unless value.matches?(Regex.new("^[\\u0009\\u000A\\u000D\\u0020-\\u00FF]+$"))
      end

      if value = @new_password
        raise Core::ValidationError.new("NewPassword length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NewPassword length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("NewPassword does not match the required pattern") unless value.matches?(Regex.new("^[\\u0009\\u000A\\u000D\\u0020-\\u00FF]+$"))
      end
    end

    def_equals_and_hash(@old_password, @new_password)
  end
end
