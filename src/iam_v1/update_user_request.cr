private alias Core = Amazonite::Core

module Amazonite::IamV1
  class UpdateUserRequest
    # Name of the user to update. If you're changing the name of the user, this is the original user
    # name.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property user_name : String

    # New path for the IAM user. Include this parameter only if you're changing the user's path.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of either a forward slash (/) by itself or a string that must begin and
    # end with forward slashes. In addition, it can contain any ASCII character from the ! (`\u0021`)
    # through the DEL character (`\u007F`), including most punctuation characters, digits, and upper
    # and lowercased letters.
    property new_path : String | Nil

    # New name for the user. Include this parameter only if you're changing the user's name.
    #
    # IAM user, group, role, and policy names must be unique within the account. Names are not
    # distinguished by case. For example, you cannot create resources named both "MyResource" and
    # "myresource".
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

    def validate! : Nil
      if value = @user_name
        raise Core::ValidationError.new("UserName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("UserName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("UserName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @new_path
        raise Core::ValidationError.new("NewPath length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NewPath length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("NewPath does not match the required pattern") unless value.matches?(Regex.new("^(/)|(/[!-~]+/)$"))
      end

      if value = @new_user_name
        raise Core::ValidationError.new("NewUserName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NewUserName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("NewUserName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end
    end

    def_equals_and_hash(@user_name, @new_path, @new_user_name)
  end
end
