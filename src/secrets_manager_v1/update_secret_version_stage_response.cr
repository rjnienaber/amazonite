module Amazonite::SecretsManagerV1
  class UpdateSecretVersionStageResponse
    include JSON::Serializable

    # The ARN of the secret that was updated.
    @[JSON::Field(key: "ARN")]
    property arn : String | Nil

    # The name of the secret that was updated.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    def initialize(
      @arn : String | Nil = nil,
      @name : String | Nil = nil,
    )
    end
  end
end
