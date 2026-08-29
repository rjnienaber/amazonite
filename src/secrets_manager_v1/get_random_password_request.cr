module Amazonite::SecretsManagerV1
  class GetRandomPasswordRequest
    include JSON::Serializable

    @[JSON::Field(key: "PasswordLength")]
    property password_length : Int64 | Nil

    @[JSON::Field(key: "ExcludeCharacters")]
    property exclude_characters : String | Nil

    @[JSON::Field(key: "ExcludeNumbers")]
    property exclude_numbers : Bool | Nil

    @[JSON::Field(key: "ExcludePunctuation")]
    property exclude_punctuation : Bool | Nil

    @[JSON::Field(key: "ExcludeUppercase")]
    property exclude_uppercase : Bool | Nil

    @[JSON::Field(key: "ExcludeLowercase")]
    property exclude_lowercase : Bool | Nil

    @[JSON::Field(key: "IncludeSpace")]
    property include_space : Bool | Nil

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
  end
end
