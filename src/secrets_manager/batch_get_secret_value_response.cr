private alias Core = Amazonite::Core

module Amazonite::SecretsManager
  class BatchGetSecretValueResponse
    include JSON::Serializable

    # A list of secret values.
    @[JSON::Field(key: "SecretValues")]
    property secret_values : Array(SecretValueEntry) | Nil

    # Secrets Manager includes this value if there's more output available than what is included in
    # the current response. This can occur even when the response includes no values at all, such as
    # when you ask for a filtered view of a long list. To get the next results, call
    # `BatchGetSecretValue` again with this value.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # A list of errors Secrets Manager encountered while attempting to retrieve individual secrets.
    @[JSON::Field(key: "Errors")]
    property errors : Array(APIErrorType) | Nil

    def initialize(
      @secret_values : Array(SecretValueEntry) | Nil = nil,
      @next_token : String | Nil = nil,
      @errors : Array(APIErrorType) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @secret_values
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 4096") if value.size > 4096
      end

      if value = @errors
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@secret_values, @next_token, @errors)
  end
end
