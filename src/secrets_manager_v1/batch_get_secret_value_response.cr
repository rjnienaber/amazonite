module Amazonite::SecretsManagerV1
  class BatchGetSecretValueResponse
    include JSON::Serializable

    @[JSON::Field(key: "SecretValues")]
    property secret_values : Array(SecretValueEntry) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "Errors")]
    property errors : Array(APIErrorType) | Nil

    def initialize(
      @secret_values : Array(SecretValueEntry) | Nil = nil,
      @next_token : String | Nil = nil,
      @errors : Array(APIErrorType) | Nil = nil,
    )
    end
  end
end
