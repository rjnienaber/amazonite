module Amazonite::SecretsManagerV1
  class APIErrorType
    include JSON::Serializable

    @[JSON::Field(key: "SecretId")]
    property secret_id : String | Nil

    @[JSON::Field(key: "ErrorCode")]
    property error_code : String | Nil

    @[JSON::Field(key: "Message")]
    property message : String | Nil

    def initialize(
      @secret_id : String | Nil = nil,
      @error_code : String | Nil = nil,
      @message : String | Nil = nil,
    )
    end
  end
end
