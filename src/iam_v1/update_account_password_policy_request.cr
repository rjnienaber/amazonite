private alias Core = Amazonite::Core

module Amazonite::IamV1
  class UpdateAccountPasswordPolicyRequest
    # The minimum number of characters allowed in an IAM user password.
    #
    # If you do not specify a value for this parameter, then the operation uses the default value of
    # `6`.
    property minimum_password_length : Int32 | Nil

    # Specifies whether IAM user passwords must contain at least one of the following non-alphanumeric
    # characters:
    #
    # ! @ # $ % ^ & * ( ) _ + - = [ ] { } | '
    #
    # If you do not specify a value for this parameter, then the operation uses the default value of
    # `false`. The result is that passwords do not require at least one symbol character.
    property require_symbols : Bool | Nil

    # Specifies whether IAM user passwords must contain at least one numeric character (0 to 9).
    #
    # If you do not specify a value for this parameter, then the operation uses the default value of
    # `false`. The result is that passwords do not require at least one numeric character.
    property require_numbers : Bool | Nil

    # Specifies whether IAM user passwords must contain at least one uppercase character from the ISO
    # basic Latin alphabet (A to Z).
    #
    # If you do not specify a value for this parameter, then the operation uses the default value of
    # `false`. The result is that passwords do not require at least one uppercase character.
    property require_uppercase_characters : Bool | Nil

    # Specifies whether IAM user passwords must contain at least one lowercase character from the ISO
    # basic Latin alphabet (a to z).
    #
    # If you do not specify a value for this parameter, then the operation uses the default value of
    # `false`. The result is that passwords do not require at least one lowercase character.
    property require_lowercase_characters : Bool | Nil

    # Allows all IAM users in your account to use the Amazon Web Services Management Console to change
    # their own passwords. For more information, see [Permitting IAM users to change their own
    # passwords](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_passwords_enable-user-change.html)
    # in the *IAM User Guide*.
    #
    # If you do not specify a value for this parameter, then the operation uses the default value of
    # `false`. The result is that IAM users in the account do not automatically have permissions to
    # change their own password.
    property allow_users_to_change_password : Bool | Nil

    # The number of days that an IAM user password is valid.
    #
    # If you do not specify a value for this parameter, then the operation uses the default value of
    # `0`. The result is that IAM user passwords never expire.
    property max_password_age : Int32 | Nil

    # Specifies the number of previous passwords that IAM users are prevented from reusing.
    #
    # If you do not specify a value for this parameter, then the operation uses the default value of
    # `0`. The result is that IAM users are not prevented from reusing previous passwords.
    property password_reuse_prevention : Int32 | Nil

    # Prevents IAM users who are accessing the account via the Amazon Web Services Management Console
    # from setting a new console password after their password has expired. The IAM user cannot access
    # the console until an administrator resets the password.
    #
    # If you do not specify a value for this parameter, then the operation uses the default value of
    # `false`. The result is that IAM users can change their passwords after they expire and continue
    # to sign in as the user.
    #
    # In the Amazon Web Services Management Console, the custom password policy option **Allow users
    # to change their own password** gives IAM users permissions to `iam:ChangePassword` for only
    # their user and to the `iam:GetAccountPasswordPolicy` action. This option does not attach a
    # permissions policy to each user, rather the permissions are applied at the account-level for all
    # users by IAM. IAM users with `iam:ChangePassword` permission and active access keys can reset
    # their own expired console password using the CLI or API.
    property hard_expiry : Bool | Nil

    def initialize(
      @minimum_password_length : Int32 | Nil = nil,
      @require_symbols : Bool | Nil = nil,
      @require_numbers : Bool | Nil = nil,
      @require_uppercase_characters : Bool | Nil = nil,
      @require_lowercase_characters : Bool | Nil = nil,
      @allow_users_to_change_password : Bool | Nil = nil,
      @max_password_age : Int32 | Nil = nil,
      @password_reuse_prevention : Int32 | Nil = nil,
      @hard_expiry : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @minimum_password_length
        params << {"#{prefix}MinimumPasswordLength", value.to_s}
      end

      if value = @require_symbols
        params << {"#{prefix}RequireSymbols", Core::QueryValue.bool(value)}
      end

      if value = @require_numbers
        params << {"#{prefix}RequireNumbers", Core::QueryValue.bool(value)}
      end

      if value = @require_uppercase_characters
        params << {"#{prefix}RequireUppercaseCharacters", Core::QueryValue.bool(value)}
      end

      if value = @require_lowercase_characters
        params << {"#{prefix}RequireLowercaseCharacters", Core::QueryValue.bool(value)}
      end

      if value = @allow_users_to_change_password
        params << {"#{prefix}AllowUsersToChangePassword", Core::QueryValue.bool(value)}
      end

      if value = @max_password_age
        params << {"#{prefix}MaxPasswordAge", value.to_s}
      end

      if value = @password_reuse_prevention
        params << {"#{prefix}PasswordReusePrevention", value.to_s}
      end

      if value = @hard_expiry
        params << {"#{prefix}HardExpiry", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        minimum_password_length: Core::XMLValue.i32(node.xpath_node("*[local-name()='MinimumPasswordLength']")),
        require_symbols: Core::XMLValue.bool(node.xpath_node("*[local-name()='RequireSymbols']")),
        require_numbers: Core::XMLValue.bool(node.xpath_node("*[local-name()='RequireNumbers']")),
        require_uppercase_characters: Core::XMLValue.bool(node.xpath_node("*[local-name()='RequireUppercaseCharacters']")),
        require_lowercase_characters: Core::XMLValue.bool(node.xpath_node("*[local-name()='RequireLowercaseCharacters']")),
        allow_users_to_change_password: Core::XMLValue.bool(node.xpath_node("*[local-name()='AllowUsersToChangePassword']")),
        max_password_age: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxPasswordAge']")),
        password_reuse_prevention: Core::XMLValue.i32(node.xpath_node("*[local-name()='PasswordReusePrevention']")),
        hard_expiry: Core::XMLValue.bool(node.xpath_node("*[local-name()='HardExpiry']")),
      )
    end
  end
end
