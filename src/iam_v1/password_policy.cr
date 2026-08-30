private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains information about the account password policy.
  #
  # This data type is used as a response element in the
  # [GetAccountPasswordPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccountPasswordPolicy.html)
  # operation.
  class PasswordPolicy
    # Minimum length to require for IAM user passwords.
    property minimum_password_length : Int32 | Nil

    # Specifies whether IAM user passwords must contain at least one of the following symbols:
    #
    # ! @ # $ % ^ & * ( ) _ + - = [ ] { } | '
    property require_symbols : Bool | Nil

    # Specifies whether IAM user passwords must contain at least one numeric character (0 to 9).
    property require_numbers : Bool | Nil

    # Specifies whether IAM user passwords must contain at least one uppercase character (A to Z).
    property require_uppercase_characters : Bool | Nil

    # Specifies whether IAM user passwords must contain at least one lowercase character (a to z).
    property require_lowercase_characters : Bool | Nil

    # Specifies whether IAM users are allowed to change their own password. Gives IAM users
    # permissions to `iam:ChangePassword` for only their user and to the
    # `iam:GetAccountPasswordPolicy` action. This option does not attach a permissions policy to each
    # user, rather the permissions are applied at the account-level for all users by IAM.
    property allow_users_to_change_password : Bool | Nil

    # Indicates whether passwords in the account expire. Returns true if `MaxPasswordAge` contains a
    # value greater than 0. Returns false if MaxPasswordAge is 0 or not present.
    property expire_passwords : Bool | Nil

    # The number of days that an IAM user password is valid.
    property max_password_age : Int32 | Nil

    # Specifies the number of previous passwords that IAM users are prevented from reusing.
    property password_reuse_prevention : Int32 | Nil

    # Specifies whether IAM users are prevented from setting a new password via the Amazon Web
    # Services Management Console after their password has expired. The IAM user cannot access the
    # console until an administrator resets the password. IAM users with `iam:ChangePassword`
    # permission and active access keys can reset their own expired console password using the CLI or
    # API.
    property hard_expiry : Bool | Nil

    def initialize(
      @minimum_password_length : Int32 | Nil = nil,
      @require_symbols : Bool | Nil = nil,
      @require_numbers : Bool | Nil = nil,
      @require_uppercase_characters : Bool | Nil = nil,
      @require_lowercase_characters : Bool | Nil = nil,
      @allow_users_to_change_password : Bool | Nil = nil,
      @expire_passwords : Bool | Nil = nil,
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

      if value = @expire_passwords
        params << {"#{prefix}ExpirePasswords", Core::QueryValue.bool(value)}
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
        expire_passwords: Core::XMLValue.bool(node.xpath_node("*[local-name()='ExpirePasswords']")),
        max_password_age: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxPasswordAge']")),
        password_reuse_prevention: Core::XMLValue.i32(node.xpath_node("*[local-name()='PasswordReusePrevention']")),
        hard_expiry: Core::XMLValue.bool(node.xpath_node("*[local-name()='HardExpiry']")),
      )
    end

    def validate! : Nil
      if value = @minimum_password_length
        raise Core::ValidationError.new("MinimumPasswordLength value must be >= 6") if value < 6
        raise Core::ValidationError.new("MinimumPasswordLength value must be <= 128") if value > 128
      end

      if value = @max_password_age
        raise Core::ValidationError.new("MaxPasswordAge value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxPasswordAge value must be <= 1095") if value > 1095
      end

      if value = @password_reuse_prevention
        raise Core::ValidationError.new("PasswordReusePrevention value must be >= 1") if value < 1
        raise Core::ValidationError.new("PasswordReusePrevention value must be <= 24") if value > 24
      end
    end

    def_equals_and_hash(@minimum_password_length, @require_symbols, @require_numbers, @require_uppercase_characters, @require_lowercase_characters, @allow_users_to_change_password, @expire_passwords, @max_password_age, @password_reuse_prevention, @hard_expiry)
  end
end
