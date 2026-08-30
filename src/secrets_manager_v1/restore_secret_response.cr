private alias Core = Amazonite::Core

module Amazonite::SecretsManagerV1
  class RestoreSecretResponse
    include JSON::Serializable

    # The ARN of the secret that was restored.
    @[JSON::Field(key: "ARN")]
    property arn : String | Nil

    # The name of the secret that was restored.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    def initialize(
      @arn : String | Nil = nil,
      @name : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @arn
        raise Core::ValidationError.new("ARN length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("ARN length must be <= 2048") if value.size > 2048
      end

      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 256") if value.size > 256
      end
    end

    def_equals_and_hash(@arn, @name)
  end
end
