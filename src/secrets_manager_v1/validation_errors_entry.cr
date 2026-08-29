module Amazonite::SecretsManagerV1
  class ValidationErrorsEntry
    include JSON::Serializable

    @[JSON::Field(key: "CheckName")]
    property check_name : String | Nil

    @[JSON::Field(key: "ErrorMessage")]
    property error_message : String | Nil

    def initialize(
      @check_name : String | Nil = nil,
      @error_message : String | Nil = nil,
    )
    end
  end
end
