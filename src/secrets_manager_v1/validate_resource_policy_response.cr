module Amazonite::SecretsManagerV1
  class ValidateResourcePolicyResponse
    include JSON::Serializable

    # True if your policy passes validation, otherwise false.
    @[JSON::Field(key: "PolicyValidationPassed")]
    property policy_validation_passed : Bool | Nil

    # Validation errors if your policy didn't pass validation.
    @[JSON::Field(key: "ValidationErrors")]
    property validation_errors : Array(ValidationErrorsEntry) | Nil

    def initialize(
      @policy_validation_passed : Bool | Nil = nil,
      @validation_errors : Array(ValidationErrorsEntry) | Nil = nil,
    )
    end
  end
end
