private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @check_name
        raise Core::ValidationError.new("CheckName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CheckName length must be <= 512") if value.size > 512
      end
    end

    def_equals_and_hash(@check_name, @error_message)
  end
end
