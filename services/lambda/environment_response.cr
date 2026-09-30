private alias Core = Amazonite::Core

module Amazonite::Lambda
  # The results of an operation to update or read environment variables. If the operation succeeds,
  # the response contains the environment variables. If it fails, the response contains details
  # about the error.
  class EnvironmentResponse
    include JSON::Serializable

    # Environment variable key-value pairs. Omitted from CloudTrail logs.
    @[JSON::Field(key: "Variables")]
    property variables : Hash(String, String) | Nil

    # Error messages for environment variables that couldn't be applied.
    @[JSON::Field(key: "Error")]
    property error : EnvironmentError | Nil

    def initialize(
      @variables : Hash(String, String) | Nil = nil,
      @error : EnvironmentError | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @error
        value.validate!
      end
    end

    def_equals_and_hash(@variables, @error)
  end
end
