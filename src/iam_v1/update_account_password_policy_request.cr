private alias Core = Amazonite::Core

module Amazonite::IamV1
  class UpdateAccountPasswordPolicyRequest
    property minimum_password_length : Int32 | Nil

    property require_symbols : Bool | Nil

    property require_numbers : Bool | Nil

    property require_uppercase_characters : Bool | Nil

    property require_lowercase_characters : Bool | Nil

    property allow_users_to_change_password : Bool | Nil

    property max_password_age : Int32 | Nil

    property password_reuse_prevention : Int32 | Nil

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
