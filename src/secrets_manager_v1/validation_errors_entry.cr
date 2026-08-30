module Amazonite::SecretsManagerV1
  # Displays errors that occurred during validation of the resource policy.
  class ValidationErrorsEntry
    include JSON::Serializable

    # Checks the name of the policy.
    @[JSON::Field(key: "CheckName")]
    property check_name : String | Nil

    # Displays error messages if validation encounters problems during validation of the resource
    # policy.
    @[JSON::Field(key: "ErrorMessage")]
    property error_message : String | Nil

    def initialize(
      @check_name : String | Nil = nil,
      @error_message : String | Nil = nil,
    )
    end

    def_equals_and_hash(@check_name, @error_message)
  end
end
