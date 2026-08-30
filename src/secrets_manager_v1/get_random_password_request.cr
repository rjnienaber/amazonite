private alias Core = Amazonite::Core

module Amazonite::SecretsManagerV1
  class GetRandomPasswordRequest
    include JSON::Serializable

    # The length of the password. If you don't include this parameter, the default length is 32
    # characters.
    @[JSON::Field(key: "PasswordLength")]
    property password_length : Int64 | Nil

    # A string of the characters that you don't want in the password.
    @[JSON::Field(key: "ExcludeCharacters")]
    property exclude_characters : String | Nil

    # Specifies whether to exclude numbers from the password. If you don't include this switch, the
    # password can contain numbers.
    @[JSON::Field(key: "ExcludeNumbers")]
    property exclude_numbers : Bool | Nil

    # Specifies whether to exclude the following punctuation characters from the password: `! " # $ %
    # & ' ( ) * + , - . / : ; ? @ [ \ ] ^ _ ` { | } ~`. If you don't include this switch, the password
    # can contain punctuation.
    @[JSON::Field(key: "ExcludePunctuation")]
    property exclude_punctuation : Bool | Nil

    # Specifies whether to exclude uppercase letters from the password. If you don't include this
    # switch, the password can contain uppercase letters.
    @[JSON::Field(key: "ExcludeUppercase")]
    property exclude_uppercase : Bool | Nil

    # Specifies whether to exclude lowercase letters from the password. If you don't include this
    # switch, the password can contain lowercase letters.
    @[JSON::Field(key: "ExcludeLowercase")]
    property exclude_lowercase : Bool | Nil

    # Specifies whether to include the space character. If you include this switch, the password can
    # contain space characters.
    @[JSON::Field(key: "IncludeSpace")]
    property include_space : Bool | Nil

    # Specifies whether to include at least one upper and lowercase letter, one number, and one
    # punctuation. If you don't include this switch, the password contains at least one of every
    # character type.
    @[JSON::Field(key: "RequireEachIncludedType")]
    property require_each_included_type : Bool | Nil

    def initialize(
      @password_length : Int64 | Nil = nil,
      @exclude_characters : String | Nil = nil,
      @exclude_numbers : Bool | Nil = nil,
      @exclude_punctuation : Bool | Nil = nil,
      @exclude_uppercase : Bool | Nil = nil,
      @exclude_lowercase : Bool | Nil = nil,
      @include_space : Bool | Nil = nil,
      @require_each_included_type : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @password_length
        raise Core::ValidationError.new("PasswordLength value must be >= 1") if value < 1
        raise Core::ValidationError.new("PasswordLength value must be <= 4096") if value > 4096
      end

      if value = @exclude_characters
        raise Core::ValidationError.new("ExcludeCharacters length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("ExcludeCharacters length must be <= 4096") if value.size > 4096
      end
    end

    def_equals_and_hash(@password_length, @exclude_characters, @exclude_numbers, @exclude_punctuation, @exclude_uppercase, @exclude_lowercase, @include_space, @require_each_included_type)
  end
end
